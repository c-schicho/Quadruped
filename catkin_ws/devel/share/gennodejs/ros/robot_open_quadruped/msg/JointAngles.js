// Auto-generated. Do not edit!

// (in-package robot_open_quadruped.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointAngles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lf = null;
      this.rf = null;
      this.lr = null;
      this.rr = null;
    }
    else {
      if (initObj.hasOwnProperty('lf')) {
        this.lf = initObj.lf
      }
      else {
        this.lf = [];
      }
      if (initObj.hasOwnProperty('rf')) {
        this.rf = initObj.rf
      }
      else {
        this.rf = [];
      }
      if (initObj.hasOwnProperty('lr')) {
        this.lr = initObj.lr
      }
      else {
        this.lr = [];
      }
      if (initObj.hasOwnProperty('rr')) {
        this.rr = initObj.rr
      }
      else {
        this.rr = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointAngles
    // Serialize message field [lf]
    bufferOffset = _arraySerializer.float32(obj.lf, buffer, bufferOffset, null);
    // Serialize message field [rf]
    bufferOffset = _arraySerializer.float32(obj.rf, buffer, bufferOffset, null);
    // Serialize message field [lr]
    bufferOffset = _arraySerializer.float32(obj.lr, buffer, bufferOffset, null);
    // Serialize message field [rr]
    bufferOffset = _arraySerializer.float32(obj.rr, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointAngles
    let len;
    let data = new JointAngles(null);
    // Deserialize message field [lf]
    data.lf = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [rf]
    data.rf = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [lr]
    data.lr = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [rr]
    data.rr = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.lf.length;
    length += 4 * object.rf.length;
    length += 4 * object.lr.length;
    length += 4 * object.rr.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_open_quadruped/JointAngles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c6a98af594d0c3ce471d3f5de59a13a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] lf
    float32[] rf
    float32[] lr
    float32[] rr
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointAngles(null);
    if (msg.lf !== undefined) {
      resolved.lf = msg.lf;
    }
    else {
      resolved.lf = []
    }

    if (msg.rf !== undefined) {
      resolved.rf = msg.rf;
    }
    else {
      resolved.rf = []
    }

    if (msg.lr !== undefined) {
      resolved.lr = msg.lr;
    }
    else {
      resolved.lr = []
    }

    if (msg.rr !== undefined) {
      resolved.rr = msg.rr;
    }
    else {
      resolved.rr = []
    }

    return resolved;
    }
};

module.exports = JointAngles;
