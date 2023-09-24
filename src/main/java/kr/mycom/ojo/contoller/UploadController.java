package kr.mycom.ojo.contoller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.mycom.ojo.model.Review_imgVo;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {

		System.out.println("upload ajax");
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Review_imgVo>> uploadAjaxPost(MultipartFile[] uploadFile, int rcode, int ucode,
			HttpServletRequest request) {

		System.out.println("uploadAjaxAction Start");
		List<Review_imgVo> list = new ArrayList<Review_imgVo>();

		String uploadFolder = "c:\\ojo\\upload";

		System.out.println(uploadFolder);
		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			Review_imgVo imgvo = new Review_imgVo();
			System.out.println("uploadAjaxAction rcode : " + rcode);
			imgvo.setRcode(rcode);
			imgvo.setUcode(ucode);

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("only file name: " + uploadFileName);
			imgvo.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				imgvo.setUuid(uuid.toString());
				imgvo.setUploadPath(uploadFolderPath);

				if (checkImageType(saveFile)) {

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();
				}

				// add to List
				list.add(imgvo);
				System.out.println("uploadController : " + imgvo);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<List<Review_imgVo>>(list, HttpStatus.OK);
		// return list;
	}

	@PostMapping("/UploadProfile")
	public void uploadAjaxPost2(MultipartFile uploadFile, String username) {
		System.out.println("UploadProfile 들옴");
		String uploadFolder = "C:\\ojo\\profile";
		String uploadFileName = null;
		String FileName = null;
		System.out.println(username);
		/* FileName = uploadFile.getOriginalFilename(); */
		/* String Extension = FileName.substring(FileName.lastIndexOf(".")); */
		uploadFileName = username.concat(".jpg");
		// IE has file path
		System.out.println(uploadFileName);
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		System.out.println(uploadFileName);
		File saveFile = new File(uploadFolder, uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
		} // end catch

	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, Integer rcode, HttpServletRequest request) {
		System.out.println("fileName: " + fileName);

		File file = new File("c:\\ojo\\upload\\" + fileName);
		System.out.println("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {

		System.out.println("deleteFile: " + fileName);

		File file;

		try {
			file = new File("c:\\ojo\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			String largeFileName = file.getAbsolutePath().replace("s_", "");

			System.out.println("largeFileName: " + largeFileName);

			file = new File(largeFileName);

			file.delete();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}
