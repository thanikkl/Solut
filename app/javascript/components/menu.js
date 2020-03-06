const initNavbarMenu = () => {
  const menuButton = document.querySelector("#menuButton");
  const menu = document.querySelector("#sideMenu");
  const menuClose = document.querySelector("#menuClose");
  menuButton.addEventListener("click", (event) => {
    event.preventDefault();
    menu.classList.add("open");
  });
  menuClose.addEventListener("click", (event) => {
    menu.classList.remove("open");
  });
}
export default initNavbarMenu;
