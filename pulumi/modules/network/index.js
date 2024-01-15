// network index

const pulumi = require("@pulumi/pulumi");
const aws = require("@pulumi/aws");
const awsNative = require("@pulumi/aws-native");
const { vpcName, cidrBlock } = require("./inputs");

const vpc = new awsNative.ec2.Vpc("my-vpc", {
    cidrBlock: cidrBlock,
    enableDnsHostnames: true,
    enableDnsSupport: true,
});