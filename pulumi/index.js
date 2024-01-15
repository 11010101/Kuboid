// "use strict";
// const pulumi = require("@pulumi/pulumi");
// const aws = require("@pulumi/aws");
// const awsx = require("@pulumi/awsx");
// require('dotenv').config({ path: '../.env' });

// const appName = "app"

// // Create an VPC
// const vpc = new aws.ec2.Vpc(appName,{
//     //options
    
// });

const pulumi = require('@pulumi/pulumi');
const aws_native = require('@pulumi/aws-native');

// Create a new VPC within AWS using the aws-native provider
const vpc = new aws_native.ec2.Vpc("customVpc", {
    // The CIDR block for the VPC which defines the IP range for the VPC.
    // The following allows for 65,536 private IP addresses (10.0.0.0 to 10.0.255.255).
    cidrBlock: "10.0.0.0/16",
    
    // Configuration parameters to enable DNS support.
    // This influences the behavior of DNS resolution and hostname assignment within the VPC.
    enableDnsSupport: true,
    
    // This setting lets instances in the VPC receive a DNS hostname.
    // This can be helpful for connecting to instances without remembering their IP addresses.
    enableDnsHostnames: true,

    // Optionally, you can add tags to the VPC for easier identification, organization, or other use cases.
    // Tags are key-value pairs that you attach to AWS resources.
    tags: {
        Name: "CustomVPC",
        ManagedBy: "Pulumi"
    }
});

// Output the VPC ID so that it can be used outside of Pulumi if necessary.
exports.vpcId = vpc.id;