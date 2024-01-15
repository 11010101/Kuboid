# login

    pulumi login file://.  

*login locally setting state file location as current dir*

# choices
- local vs cloud
- components vs modules
- native vs classic

# quick-start

    pulumi new aws-javascript --force

*if dir is not empty will need to force*

### files
- Pulumi.yaml defines the project.
- Pulumi.dev.yaml contains configuration values for the stack you just initialized.
- index.js is the Pulumi program that defines your stack resources.

# resources

    const bucket = new aws.s3.Bucket("my-bucket");
*create a s3 bucket, named "my-bucket"*

    const bucketObject = new aws.s3.BucketObject("index.html", {
        bucket: bucket.id,
        source: new pulumi.asset.FileAsset("./index.html") 
    }, { dependsOn: publicAccessBlock });
*create a new bucket object, in the specified bucket, given a specific creation order dependancy*

# outputs
    
    exports.bucketName = bucket.id;
*export the name of the bucket*

# CLI commands
- pulumi up
- pulumi destroy
- pulumi stack rm  
*destroys stack completely*
- pulumi stack output OUTPUTNAME  
*prints the output to the CLI*

# misc 
    pulumi.interpolate`http://${bucket.websiteEndpoint}`
*interpolates variable value into string*

# definitions

- projects and stacks  
*Consider a Pulumi project to be analogous to a GitHub repo*  
*and a stack to be an instance of that code with a separate configuration*  

- crosswalk  
*modules for quick builds with default layouts*

- components and modules
*modules export a function that returns a resource, can pass args to this function*
*components 