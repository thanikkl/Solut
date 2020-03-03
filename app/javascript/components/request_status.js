const requestStatus = () => {
  const statusSelection = document.querySelectorAll(".js-updateContact");

  statusSelection.forEach(element => {
    element.addEventListener("click", (event) => {
      const path = event.currentTarget.dataset.path
      const token = document.getElementById('csrf_token').value
      const headers = new Headers({ 'X-CSRF-TOKEN': token });
      const contact_id = event.currentTarget.dataset.contactId

      fetch(path, { method: 'PATCH', headers })
      .then(response => response.text())
      .then(html => {
        document.getElementById('anchor_' + contact_id).innerHTML = html
      })
    })
  })
};

export default requestStatus;
