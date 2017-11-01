package delight.fileupload

/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import java.io.BufferedReader
import java.io.ByteArrayInputStream
import java.io.IOException
import java.io.InputStream
import java.io.UnsupportedEncodingException
import java.security.Principal
import java.util.Enumeration
import java.util.HashMap
import java.util.Locale
import java.util.Map
import javax.servlet.RequestDispatcher
import javax.servlet.ServletInputStream
import javax.servlet.ServletRequest
import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import org.apache.commons.fileupload.FileUploadBase
import javax.servlet.http.HttpServletResponse
import javax.servlet.ServletException
import javax.servlet.http.HttpUpgradeHandler
import javax.servlet.ServletResponse
import javax.servlet.ReadListener

/** 
 * @version $Id$
 */
class MockHttpServletRequest implements HttpServletRequest {
	final InputStream m_requestData
	long length
	final String m_strContentType
	int readLimit = -1
	final Map<String, String> m_headers = new HashMap<String, String>()

	/** 
	 * Creates a new instance with the given request data and content type.
	 */
	new(byte[] requestData, String strContentType) {
		this(new ByteArrayInputStream(requestData), requestData.length, strContentType)
	}

	/** 
	 * Creates a new instance with the given request data and content type.
	 */
	new(InputStream requestData, long requestLength, String strContentType) {
		m_requestData = requestData
		length = requestLength
		m_strContentType = strContentType
		m_headers.put(FileUploadBase::CONTENT_TYPE, strContentType)
	}

	/** 
	 * @see HttpServletRequest#getAuthType()
	 */
	override String getAuthType() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getCookies()
	 */
	override Cookie[] getCookies() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getDateHeader(String)
	 */
	override long getDateHeader(String arg0) {
		return 0
	}

	/** 
	 * @see HttpServletRequest#getHeader(String)
	 */
	override String getHeader(String headerName) {
		return m_headers.get(headerName)
	}

	/** 
	 * @see HttpServletRequest#getHeaders(String)
	 */
	override Enumeration<String> getHeaders(String arg0) {
		// todo - implement
		return null
	}

	/** 
	 * @see HttpServletRequest#getHeaderNames()
	 */
	override Enumeration<String> getHeaderNames() {
		// todo - implement
		return null
	}

	/** 
	 * @see HttpServletRequest#getIntHeader(String)
	 */
	override int getIntHeader(String arg0) {
		return 0
	}

	/** 
	 * @see HttpServletRequest#getMethod()
	 */
	override String getMethod() {
		return "POST"
	}

	/** 
	 * @see HttpServletRequest#getPathInfo()
	 */
	override String getPathInfo() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getPathTranslated()
	 */
	override String getPathTranslated() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getContextPath()
	 */
	override String getContextPath() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getQueryString()
	 */
	override String getQueryString() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getRemoteUser()
	 */
	override String getRemoteUser() {
		return null
	}

	/** 
	 * @see HttpServletRequest#isUserInRole(String)
	 */
	override boolean isUserInRole(String arg0) {
		return false
	}

	/** 
	 * @see HttpServletRequest#getUserPrincipal()
	 */
	override Principal getUserPrincipal() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getRequestedSessionId()
	 */
	override String getRequestedSessionId() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getRequestURI()
	 */
	override String getRequestURI() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getRequestURL()
	 */
	override StringBuffer getRequestURL() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getServletPath()
	 */
	override String getServletPath() {
		return null
	}

	/** 
	 * @see HttpServletRequest#getSession(boolean)
	 */
	override HttpSession getSession(boolean arg0) {
		return null
	}

	/** 
	 * @see HttpServletRequest#getSession()
	 */
	override HttpSession getSession() {
		return null
	}

	/** 
	 * @see HttpServletRequest#isRequestedSessionIdValid()
	 */
	override boolean isRequestedSessionIdValid() {
		return false
	}

	/** 
	 * @see HttpServletRequest#isRequestedSessionIdFromCookie()
	 */
	override boolean isRequestedSessionIdFromCookie() {
		return false
	}

	/** 
	 * @see HttpServletRequest#isRequestedSessionIdFromURL()
	 */
	override boolean isRequestedSessionIdFromURL() {
		return false
	}

	/** 
	 * @see HttpServletRequest#isRequestedSessionIdFromUrl()
	 * @deprecated
	 */
	@Deprecated override boolean isRequestedSessionIdFromUrl() {
		return false
	}

	/** 
	 * @see ServletRequest#getAttribute(String)
	 */
	override Object getAttribute(String arg0) {
		return null
	}

	/** 
	 * @see ServletRequest#getAttributeNames()
	 */
	override Enumeration<String> getAttributeNames() {
		return null
	}

	/** 
	 * @see ServletRequest#getCharacterEncoding()
	 */
	override String getCharacterEncoding() {
		return null
	}

	/** 
	 * @see ServletRequest#setCharacterEncoding(String)
	 */
	override void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
	}

	/** 
	 * @see ServletRequest#getContentLength()
	 */
	override int getContentLength() {
		var int iLength = 0
		if (null === m_requestData) {
			iLength = -1
		} else {
			if (length > Integer::MAX_VALUE) {
				throw new RuntimeException('''Value '«»«length»' is too large to be converted to int'''.toString)
			}
			iLength = length as int
		}
		return iLength
	}

	/** 
	 * For testing attack scenarios in SizesTest.
	 */
	def void setContentLength(long length) {
		this.length = length
	}

	/** 
	 * @see ServletRequest#getContentType()
	 */
	override String getContentType() {
		return m_strContentType
	}

	/** 
	 * @see ServletRequest#getInputStream()
	 */
	override ServletInputStream getInputStream() throws IOException {
		val ServletInputStream sis = new MyServletInputStream(m_requestData, readLimit)
		return sis
	}

	/** 
	 * Sets the read limit. This can be used to limit the number of bytes to
	 * read ahead.
	 * @param readLimitthe read limit to use
	 */
	def void setReadLimit(int readLimit) {
		this.readLimit = readLimit
	}

	/** 
	 * @see ServletRequest#getParameter(String)
	 */
	override String getParameter(String arg0) {
		return null
	}

	/** 
	 * @see ServletRequest#getParameterNames()
	 */
	override Enumeration<String> getParameterNames() {
		return null
	}

	/** 
	 * @see ServletRequest#getParameterValues(String)
	 */
	override String[] getParameterValues(String arg0) {
		return null
	}

	/** 
	 * @see ServletRequest#getParameterMap()
	 */
	override Map<String, String[]> getParameterMap() {
		return null
	}

	/** 
	 * @see ServletRequest#getProtocol()
	 */
	override String getProtocol() {
		return null
	}

	/** 
	 * @see ServletRequest#getScheme()
	 */
	override String getScheme() {
		return null
	}

	/** 
	 * @see ServletRequest#getServerName()
	 */
	override String getServerName() {
		return null
	}

	/** 
	 * @see ServletRequest#getLocalName()
	 */
	@SuppressWarnings("javadoc") override // This is a Servlet 2.4 method
	String getLocalName() {
		return null
	}

	/** 
	 * @see ServletRequest#getServerPort()
	 */
	override int getServerPort() {
		return 0
	}

	/** 
	 * @see ServletRequest#getLocalPort()
	 */
	@SuppressWarnings("javadoc") override // This is a Servlet 2.4 method
	int getLocalPort() {
		return 0
	}

	/** 
	 * @see ServletRequest#getRemotePort()
	 */
	@SuppressWarnings("javadoc") override // This is a Servlet 2.4 method
	int getRemotePort() {
		return 0
	}

	/** 
	 * @see ServletRequest#getReader()
	 */
	override BufferedReader getReader() throws IOException {
		return null
	}

	/** 
	 * @see ServletRequest#getRemoteAddr()
	 */
	override String getRemoteAddr() {
		return null
	}

	/** 
	 * @see ServletRequest#getLocalAddr()
	 */
	@SuppressWarnings("javadoc") override // This is a Servlet 2.4 method
	String getLocalAddr() {
		return null
	}

	/** 
	 * @see ServletRequest#getRemoteHost()
	 */
	override String getRemoteHost() {
		return null
	}

	/** 
	 * @see ServletRequest#setAttribute(String, Object)
	 */
	override void setAttribute(String arg0, Object arg1) {
	}

	/** 
	 * @see ServletRequest#removeAttribute(String)
	 */
	override void removeAttribute(String arg0) {
	}

	/** 
	 * @see ServletRequest#getLocale()
	 */
	override Locale getLocale() {
		return null
	}

	/** 
	 * @see ServletRequest#getLocales()
	 */
	override Enumeration<Locale> getLocales() {
		return null
	}

	/** 
	 * @see ServletRequest#isSecure()
	 */
	override boolean isSecure() {
		return false
	}

	/** 
	 * @see ServletRequest#getRequestDispatcher(String)
	 */
	override RequestDispatcher getRequestDispatcher(String arg0) {
		return null
	}

	/** 
	 * @see ServletRequest#getRealPath(String)
	 * @deprecated
	 */
	@Deprecated override String getRealPath(String arg0) {
		return null
	}

	private static class MyServletInputStream extends ServletInputStream {
		final InputStream in
		final int readLimit

		/** 
		 * Creates a new instance, which returns the given streams data.
		 */
		new(InputStream pStream, int readLimit) {
			in = pStream
			this.readLimit = readLimit
		}

		override int read() throws IOException {
			return in.read()
		}

		override int read(byte[] b, int off, int len) throws IOException {
			if (readLimit > 0) {
				return in.read(b, off, Math::min(readLimit, len))
			}
			return in.read(b, off, len)
		}

		override isFinished() {

			return in.available == 0;
		}

		override isReady() {
			return true;
		}

		override setReadListener(ReadListener arg0) {
		}

	}

	override authenticate(HttpServletResponse arg0) throws IOException, ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override changeSessionId() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getPart(String arg0) throws IOException, ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getParts() throws IOException, ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override login(String arg0, String arg1) throws ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override logout() throws ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override <T extends HttpUpgradeHandler> upgrade(Class<T> arg0) throws IOException, ServletException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getAsyncContext() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getContentLengthLong() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getDispatcherType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getServletContext() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override isAsyncStarted() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override isAsyncSupported() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override startAsync() throws IllegalStateException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override startAsync(ServletRequest arg0, ServletResponse arg1) throws IllegalStateException {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
