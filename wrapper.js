import initWasm, * as wasm from './api.js';  // Import the glue code and WASM

// Asynchronously initialize the WebAssembly module
async function init() {
  await initWasm();  // This loads the WebAssembly file and exposes the functions
  
  // After initialization, expose the WebAssembly function
  window.resolveWeaponSkill = wasm.resolve_weapon_skill;  // Bind the function to the window object
}

// Call the initialization function
init();