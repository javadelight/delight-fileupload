package delight.fileupload;

import java.io.UnsupportedEncodingException;

import org.junit.Test;

public class FileUploadTest {

	@Test
	public void test() throws UnsupportedEncodingException {
		String text = "-----1234\r\n" + "Content-Disposition: form-data; name=\"field\"\r\n" + "\r\n" + "fieldValue\r\n"
				+ "-----1234\r\n" + "Content-Disposition: form-data; name=\"multi\"\r\n" + "\r\n" + "value1\r\n"
				+ "-----1234\r\n" + "Content-Disposition: form-data; name=\"multi\"\r\n" + "\r\n" + "value2\r\n"
				+ "-----1234--\r\n";
		byte[] bytes = text.getBytes("US-ASCII");
		FileUpload.parse(bytes, "multipart/form-data; boundary=---1234");
	}
}
