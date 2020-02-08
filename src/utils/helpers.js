import Vue from "vue";
import store from "@/store/index.js";
import * as CONST from "@/utils/const.js";

export function getCollectonData() {
let data = store.getters.getRawData
  if (data != null && data.length != undefined && data.length > 0) {
    return data.map(element => {
      return {
        text: element["name"],
        value: element["_id"],
        full: element
      };
    });
  }
  return data;
}