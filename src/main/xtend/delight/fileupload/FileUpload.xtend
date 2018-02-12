package delight.fileupload

import java.util.List
import javax.servlet.http.HttpServletRequest
import org.apache.commons.fileupload.FileItem
import org.apache.commons.fileupload.FileItemIterator
import org.apache.commons.fileupload.servlet.ServletFileUpload

class FileUpload {

	def static List<FileItem> parse(byte[] data, String contentType) {

		val ServletFileUpload upload = new ServletFileUpload();
		val HttpServletRequest request = new MockHttpServletRequest(data, contentType);

		val isMultipart = ServletFileUpload.isMultipartContent(request);

		if (!isMultipart) {
			throw new Exception("Illegal request for uploading files. Multipart request expected.")
		}

		val List<FileItem> iter = upload.parseRequest(request)

		return iter

	}

}