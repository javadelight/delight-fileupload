package delight.fileupload

import java.util.List
import javax.servlet.http.HttpServletRequest
import org.apache.commons.fileupload.FileItem
import org.apache.commons.fileupload.FileItemFactory
import org.apache.commons.fileupload.disk.DiskFileItemFactory
import org.apache.commons.fileupload.servlet.ServletFileUpload

class FileUpload {

	def static List<FileItem> parse(byte[] data, String contentType) {
		
		val FileItemFactory factory = new DiskFileItemFactory();
		
		val ServletFileUpload upload = new ServletFileUpload(factory);
		val HttpServletRequest request = new MockHttpServletRequest(data, contentType);

		val isMultipart = ServletFileUpload.isMultipartContent(request);

		if (!isMultipart) {
			throw new Exception("Illegal request for uploading files. Multipart request expected.")
		}

		val List<FileItem> iter = upload.parseRequest(request)

		return iter

	}

}