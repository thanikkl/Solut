import swal from 'sweetalert';

const initSweetalertAccepted = () => {
  const statusSelection = document.querySelectorAll(".js-updateContact");
console.log("test--0")
  statusSelection.forEach(element => {
    console.log("test--1")

    element.addEventListener("click", (event) => {
      console.log("test--2")

      const status = event.currentTarget.dataset.status
      let options;

      if (status == "accepted") {
        options = {
          title: "Request Accepted",
          text: "You've accepted a request",
          icon: "success"
          };
      } else {
        options = {
          title: "Request Denied",
          text: "You've rejected a request",
          icon: "error"
          };
      }

      swal(options); // <-- add the `.then(callback)`
    });
  });
};

export { initSweetalertAccepted };
