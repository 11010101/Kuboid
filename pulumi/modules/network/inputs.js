// network vars

const pulumi = require("@pulumi/pulumi");

exports.vpcName = new pulumi.Input(pulumi.String, { defaultValue: "my-vpc" });
exports.cidrBlock = new pulumi.Input(pulumi.String, { defaultValue: "10.0.0.0/16" });