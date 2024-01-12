"use strict";
const pulumi = require("@pulumi/pulumi");
const aws = require("@pulumi/aws");
const awsx = require("@pulumi/awsx");
require('dotenv').config();

const appName = "app"

// Create an VPC
const vpc = new awsx.ec2.Vpc(appName,{
    //options
    
});
