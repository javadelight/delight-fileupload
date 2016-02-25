package delight.fileupload

import javax.servlet.http.HttpServletRequest
import org.apache.commons.fileupload.FileItemIterator
import org.apache.commons.fileupload.servlet.ServletFileUpload

class FileUpload {
	
	def static FileItemIterator parse(byte[] data, String contentType) {
		
		val ServletFileUpload upload = new ServletFileUpload();
			val HttpServletRequest request = new MockHttpServletRequest(data, contentType);

			val isMultipart = ServletFileUpload.isMultipartContent(request);

			if (!isMultipart) {
				throw new Exception("Illegal request for uploading files. Multipart request expected.")
			}

			val FileItemIterator iter = upload.getItemIterator(request)
			
			return iter
		
	}
	
}