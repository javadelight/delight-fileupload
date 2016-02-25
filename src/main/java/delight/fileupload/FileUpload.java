package delight.fileupload;

import delight.fileupload.MockHttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.eclipse.xtext.xbase.lib.Exceptions;

@SuppressWarnings("all")
public class FileUpload {
  public static FileItemIterator parse(final byte[] data, final String contentType) {
    try {
      final ServletFileUpload upload = new ServletFileUpload();
      final HttpServletRequest request = new MockHttpServletRequest(data, contentType);
      final boolean isMultipart = ServletFileUpload.isMultipartContent(request);
      if ((!isMultipart)) {
        throw new Exception("Illegal request for uploading files. Multipart request expected.");
      }
      final FileItemIterator iter = upload.getItemIterator(request);
      return iter;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
