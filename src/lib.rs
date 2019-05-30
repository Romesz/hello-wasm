extern crate wasm_bindgen;

use wasm_bindgen::prelude::*;

/*
#[wasm_bindgen]
extern {
    pub fn alert(s: &str);
}

#[wasm_bindgen]
pub fn greet(name: &str) {
    format!("Hello, {}!", name);
}
*/

#[wasm_bindgen]
pub fn for_check() -> String {
    let mut s = String::from("");
    let s_x = "x";
    
    for _x in 0..9999999 {
        s.push_str(s_x);
    }
    
    s
}