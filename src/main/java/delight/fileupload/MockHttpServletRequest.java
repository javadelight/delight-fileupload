package delight.fileupload;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileUploadBase;
import org.eclipse.xtend2.lib.StringConcatenation;

/**
 * @version $Id$
 */
@SuppressWarnings("all")
public class MockHttpServletRequest implements HttpServletRequest {
  private static class MyServletInputStream extends ServletInputStream {
    private final InputStream in;
    
    private final int readLimit;
    
    /**
     * Creates a new instance, which returns the given streams data.
     */
    public MyServletInputStream(final InputStream pStream, final int readLimit) {
      this.in = pStream;
      this.readLimit = readLimit;
    }
    
    @Override
    public int read() throws IOException {
      return this.in.read();
    }
    
    @Override
    public int read(final byte[] b, final int off, final int len) throws IOException {
      if ((this.readLimit > 0)) {
        int _min = Math.min(this.readLimit, len);
        return this.in.read(b, off, _min);
      }
      return this.in.read(b, off, len);
    }
  }
  
  private final InputStream m_requestData;
  
  private long length;
  
  private final String m_strContentType;
  
  private int readLimit = (-1);
  
  private final Map<String, String> m_headers = new HashMap<String, String>();
  
  /**
   * Creates a new instance with the given request data and content type.
   */
  public MockHttpServletRequest(final byte[] requestData, final String strContentType) {
    this(new ByteArrayInputStream(requestData), requestData.length, strContentType);
  }
  
  /**
   * Creates a new instance with the given request data and content type.
   */
  public MockHttpServletRequest(final InputStream requestData, final long requestLength, final String strContentType) {
    this.m_requestData = requestData;
    this.length = requestLength;
    this.m_strContentType = strContentType;
    this.m_headers.put(FileUploadBase.CONTENT_TYPE, strContentType);
  }
  
  /**
   * @see HttpServletRequest#getAuthType()
   */
  @Override
  public String getAuthType() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getCookies()
   */
  @Override
  public Cookie[] getCookies() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getDateHeader(String)
   */
  @Override
  public long getDateHeader(final String arg0) {
    return 0;
  }
  
  /**
   * @see HttpServletRequest#getHeader(String)
   */
  @Override
  public String getHeader(final String headerName) {
    return this.m_headers.get(headerName);
  }
  
  /**
   * @see HttpServletRequest#getHeaders(String)
   */
  @Override
  public Enumeration<String> getHeaders(final String arg0) {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getHeaderNames()
   */
  @Override
  public Enumeration<String> getHeaderNames() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getIntHeader(String)
   */
  @Override
  public int getIntHeader(final String arg0) {
    return 0;
  }
  
  /**
   * @see HttpServletRequest#getMethod()
   */
  @Override
  public String getMethod() {
    return "POST";
  }
  
  /**
   * @see HttpServletRequest#getPathInfo()
   */
  @Override
  public String getPathInfo() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getPathTranslated()
   */
  @Override
  public String getPathTranslated() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getContextPath()
   */
  @Override
  public String getContextPath() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getQueryString()
   */
  @Override
  public String getQueryString() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getRemoteUser()
   */
  @Override
  public String getRemoteUser() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#isUserInRole(String)
   */
  @Override
  public boolean isUserInRole(final String arg0) {
    return false;
  }
  
  /**
   * @see HttpServletRequest#getUserPrincipal()
   */
  @Override
  public Principal getUserPrincipal() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getRequestedSessionId()
   */
  @Override
  public String getRequestedSessionId() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getRequestURI()
   */
  @Override
  public String getRequestURI() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getRequestURL()
   */
  @Override
  public StringBuffer getRequestURL() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getServletPath()
   */
  @Override
  public String getServletPath() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getSession(boolean)
   */
  @Override
  public HttpSession getSession(final boolean arg0) {
    return null;
  }
  
  /**
   * @see HttpServletRequest#getSession()
   */
  @Override
  public HttpSession getSession() {
    return null;
  }
  
  /**
   * @see HttpServletRequest#isRequestedSessionIdValid()
   */
  @Override
  public boolean isRequestedSessionIdValid() {
    return false;
  }
  
  /**
   * @see HttpServletRequest#isRequestedSessionIdFromCookie()
   */
  @Override
  public boolean isRequestedSessionIdFromCookie() {
    return false;
  }
  
  /**
   * @see HttpServletRequest#isRequestedSessionIdFromURL()
   */
  @Override
  public boolean isRequestedSessionIdFromURL() {
    return false;
  }
  
  /**
   * @see HttpServletRequest#isRequestedSessionIdFromUrl()
   * @deprecated
   */
  @Deprecated
  @Override
  public boolean isRequestedSessionIdFromUrl() {
    return false;
  }
  
  /**
   * @see ServletRequest#getAttribute(String)
   */
  @Override
  public Object getAttribute(final String arg0) {
    return null;
  }
  
  /**
   * @see ServletRequest#getAttributeNames()
   */
  @Override
  public Enumeration<String> getAttributeNames() {
    return null;
  }
  
  /**
   * @see ServletRequest#getCharacterEncoding()
   */
  @Override
  public String getCharacterEncoding() {
    return null;
  }
  
  /**
   * @see ServletRequest#setCharacterEncoding(String)
   */
  @Override
  public void setCharacterEncoding(final String arg0) throws UnsupportedEncodingException {
  }
  
  /**
   * @see ServletRequest#getContentLength()
   */
  @Override
  public int getContentLength() {
    int iLength = 0;
    if ((null == this.m_requestData)) {
      iLength = (-1);
    } else {
      if ((this.length > Integer.MAX_VALUE)) {
        StringConcatenation _builder = new StringConcatenation();
        _builder.append("Value \'");
        _builder.append(this.length, "");
        _builder.append("\' is too large to be converted to int");
        String _string = _builder.toString();
        throw new RuntimeException(_string);
      }
      iLength = ((int) this.length);
    }
    return iLength;
  }
  
  /**
   * For testing attack scenarios in SizesTest.
   */
  public void setContentLength(final long length) {
    this.length = length;
  }
  
  /**
   * @see ServletRequest#getContentType()
   */
  @Override
  public String getContentType() {
    return this.m_strContentType;
  }
  
  /**
   * @see ServletRequest#getInputStream()
   */
  @Override
  public ServletInputStream getInputStream() throws IOException {
    final ServletInputStream sis = new MockHttpServletRequest.MyServletInputStream(this.m_requestData, this.readLimit);
    return sis;
  }
  
  /**
   * Sets the read limit. This can be used to limit the number of bytes to
   * read ahead.
   * @param readLimitthe read limit to use
   */
  public void setReadLimit(final int readLimit) {
    this.readLimit = readLimit;
  }
  
  /**
   * @see ServletRequest#getParameter(String)
   */
  @Override
  public String getParameter(final String arg0) {
    return null;
  }
  
  /**
   * @see ServletRequest#getParameterNames()
   */
  @Override
  public Enumeration<String> getParameterNames() {
    return null;
  }
  
  /**
   * @see ServletRequest#getParameterValues(String)
   */
  @Override
  public String[] getParameterValues(final String arg0) {
    return null;
  }
  
  /**
   * @see ServletRequest#getParameterMap()
   */
  @Override
  public Map<String, String[]> getParameterMap() {
    return null;
  }
  
  /**
   * @see ServletRequest#getProtocol()
   */
  @Override
  public String getProtocol() {
    return null;
  }
  
  /**
   * @see ServletRequest#getScheme()
   */
  @Override
  public String getScheme() {
    return null;
  }
  
  /**
   * @see ServletRequest#getServerName()
   */
  @Override
  public String getServerName() {
    return null;
  }
  
  /**
   * @see ServletRequest#getLocalName()
   */
  @SuppressWarnings("javadoc")
  @Override
  public String getLocalName() {
    return null;
  }
  
  /**
   * @see ServletRequest#getServerPort()
   */
  @Override
  public int getServerPort() {
    return 0;
  }
  
  /**
   * @see ServletRequest#getLocalPort()
   */
  @SuppressWarnings("javadoc")
  @Override
  public int getLocalPort() {
    return 0;
  }
  
  /**
   * @see ServletRequest#getRemotePort()
   */
  @SuppressWarnings("javadoc")
  @Override
  public int getRemotePort() {
    return 0;
  }
  
  /**
   * @see ServletRequest#getReader()
   */
  @Override
  public BufferedReader getReader() throws IOException {
    return null;
  }
  
  /**
   * @see ServletRequest#getRemoteAddr()
   */
  @Override
  public String getRemoteAddr() {
    return null;
  }
  
  /**
   * @see ServletRequest#getLocalAddr()
   */
  @SuppressWarnings("javadoc")
  @Override
  public String getLocalAddr() {
    return null;
  }
  
  /**
   * @see ServletRequest#getRemoteHost()
   */
  @Override
  public String getRemoteHost() {
    return null;
  }
  
  /**
   * @see ServletRequest#setAttribute(String, Object)
   */
  @Override
  public void setAttribute(final String arg0, final Object arg1) {
  }
  
  /**
   * @see ServletRequest#removeAttribute(String)
   */
  @Override
  public void removeAttribute(final String arg0) {
  }
  
  /**
   * @see ServletRequest#getLocale()
   */
  @Override
  public Locale getLocale() {
    return null;
  }
  
  /**
   * @see ServletRequest#getLocales()
   */
  @Override
  public Enumeration<Locale> getLocales() {
    return null;
  }
  
  /**
   * @see ServletRequest#isSecure()
   */
  @Override
  public boolean isSecure() {
    return false;
  }
  
  /**
   * @see ServletRequest#getRequestDispatcher(String)
   */
  @Override
  public RequestDispatcher getRequestDispatcher(final String arg0) {
    return null;
  }
  
  /**
   * @see ServletRequest#getRealPath(String)
   * @deprecated
   */
  @Deprecated
  @Override
  public String getRealPath(final String arg0) {
    return null;
  }
}
