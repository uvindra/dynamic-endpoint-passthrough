import ballerina/http;
import ballerina/log;

configurable string invoke_url = ?;
configurable string invoke_resource = ?;

service / on new http:Listener(9090) {
    resource function get greeting(http:Request req) returns json|error {
        log:printInfo("Request received");

        http:Client clientEP = check new (invoke_url);

        //log:printInfo("Request forwarded to " + invoke_url + providedPath);

        json clientResponse = check clientEP->forward("/", req);

        //json clientResponse = check clientEP->get(invoke_resource);
            
        return clientResponse;
    }
}   