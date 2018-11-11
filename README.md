# HttpRequest Tester

**This application is for testing web service connection failures only.**

This .NET application is used to determine if your web server can successfully invoke a HTTP Client request to a remote domain. If your web application is using a Web Service, WCF Service, or WebApi and the connection is not working, this could help you determine why. The deprecation of TLS 1.0 as well various SSL policy errors (i.e. certificate trust/mismatch issues) can prevent a web service/api from working. The exact reason can sometimes be frustrating to determine quickly.  

This application can help you determine why your connection isn't working by invoking a HTTP Request to the remote domain. Options are available to use different TLS versions as well as ignore certificate issues.  If the connection still doesn't work, error messages should help explain why.

To use this application, publish it to a file path on the same server that your web application is hosted.

## IMPORTANT!
It is **STRONGLY** recommended that if this application is hosted in IIS or any other hosting platform, you limit access to only your development team. Once your service connection is working, disable or remove this application. If IIS is used to host this application, IIS should not have anonymous authentication enabled on the path and the **IP and Domain Access Restriction** module should be used to allow access to only your development team for the duration of the troubleshooting.
