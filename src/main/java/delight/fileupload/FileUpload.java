package delight.fileupload;

import delight.fileupload.MockHttpServletRequest;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("all")
public class FileUpload {
  public static List<FileItem> parse(final byte[] data, final String contentType) {
    try {
      final FileItemFactory factory = new DiskFileItemFactory();
      final ServletFileUpload upload = new ServletFileUpload(factory);
      final HttpServletRequest request = new MockHttpServletRequest(data, contentType);
      final boolean isMultipart = ServletFileUpload.isMultipartContent(request);
      if ((!isMultipart)) {
        throw new Exception("Illegal request for uploading files. Multipart request expected.");
      }
      final List<FileItem> iter = upload.parseRequest(request);
      return iter;
    } catch (Throwable _e) {
      throw new RuntimeException(_e);
    }
  }
}
