"use strict";

exports.getFn = function(just, nothing, label, rec) {
  if ({}.hasOwnProperty.call(rec, label)) {
    return just(rec[label]);
  }
  return nothing;
};
