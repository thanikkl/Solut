const initTabs = () => {
  const confirmedBandsBtn = document.getElementById('confirmed-bands-btn');
  const pendingBandsBtn = document.getElementById('pending-bands-btn');
  const confirmedBands = document.querySelector('.confirmed-bands');
  const pendingBands = document.querySelector('.pending-bands');

  confirmedBandsBtn.addEventListener('click', ()=>{
    confirmedBands.classList.add('tab-active');
    pendingBands.classList.remove('tab-active');
  })
  pendingBandsBtn.addEventListener('click', ()=>{
    confirmedBands.classList.remove('tab-active');
    pendingBands.classList.add('tab-active');
  })
};

export { initTabs };
