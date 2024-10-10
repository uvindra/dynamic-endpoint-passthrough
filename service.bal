import ballerina/http;

configurable string invoke_url = ?;
configurable string invoke_resource = ?;

service / on new http:Listener(9090) {
    resource function 'default [string... path](http:Request req) returns json|error {
        http:Client clientEP = check new (invoke_url);
        json clientResponse = check clientEP->forward(invoke_resource, req);
        return clientResponse;
    }
}