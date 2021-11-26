export function greet(name) {
  console.log("Hello, " + name);
}

export function addInvoiceEmail() {
  const createButton = document.getElementById("addInvoiceEmail");
  createButton.addEventListener("click", () => {

    const lastId = document.querySelector("#fieldsetContainer").lastElementChild.id;

    const newId = parseInt(lastId, 10) + 1;

    const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);

    document.querySelector("#fieldsetContainer").insertAdjacentHTML(
      "beforeend", newFieldset
    );
  });
}

// export const addInvoiceEmail = ()=> {
//   const createButton = document.getElementById("addInvoiceEmail");
//   createButton.addEventListener("click", () => {

//     const lastId = document.querySelector("#fieldsetContainer").lastElementChild.id;

//     const newId = parseInt(lastId, 10) + 1;

//     const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);

//     document.querySelector("#fieldsetContainer").insertAdjacentHTML(
//       "beforeend", newFieldset
//     );
//   });
// }
// export { addInvoiceEmail }