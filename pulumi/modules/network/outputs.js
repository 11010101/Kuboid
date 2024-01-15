// network outputs

const { vpc } = require("./index");

exports.vpcId = vpc.id;
exports.publicSubnetIds = vpc.publicSubnetIds;