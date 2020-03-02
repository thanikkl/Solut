const initNavbarMenu = () => {
  const menuButton = document.querySelector("#menuButton");
  const menu = document.querySelector("#sideMenu");
  const menuClose = document.querySelector("#menuClose");
  console.log(menuButton);
  menuButton.addEventListener("click", (event) => {
    event.preventDefault();
    menu.classList.add("open");
  });
  menuClose.addEventListener("click", (event) => {
    menu.classList.remove("open");
  });
}
export default initNavbarMenu;
