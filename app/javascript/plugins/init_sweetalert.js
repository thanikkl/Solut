import swal from 'sweetalert';

const initSweetalert = () => {
  const options = {
    title: "Request",
    text: "Request Sent",
    icon: "success"
    };
  const callback = () => {};
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };
