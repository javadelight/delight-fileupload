[![Build Status](https://travis-ci.org/javadelight/delight-fileupload.svg?branch=master)](https://travis-ci.org/javadelight/delight-fileupload)

# delight-fileupload

A simple wrapper for [Apache Commons FileUpload](https://commons.apache.org/proper/commons-fileupload/) for allowing it 
to work with Netty and other IO servers.

Part of the [Java Delight Suite](http://javadelight.org).

## Usage

First obtain the raw data of the request in the framework you are using:

    byte[] data = ... posted data
    
    String contentType = ... header "Content-Type"
    
Then call customized FileUpload to process the request:    
    
    FileItemIterator iterator = FileUpload.parse(data, contentType);

Finally, process the items in the multipart request:

    while (iter.hasNext()) {
        FileItemStream item = iter.next();

        if (item.isFormField()) {
            ... some fields in the form
        } else {
            InputStream stream = item.openStream();
            // work with uploaded file data by processing stream ...
        }
        
    }




