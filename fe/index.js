const js = import("@romesz89/hello-wasm/hello_wasm.js");

js.then(data => {
  //console.log(data);
  document.getElementById('rs').addEventListener('click', () => console.log(data.for_check()));
});


const for_check_js = () => {
  let x = '';
  const x_s = 'x';

  for(let i = 0 ; i < 9999999 ; i++) {
    x += x_s;
  }

  return x;
}

document.getElementById('js').addEventListener('click', () => console.log(for_check_js()));