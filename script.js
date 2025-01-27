// Get all sections and scroll dots
const sections = document.querySelectorAll('section');
const scrollDots = document.querySelectorAll('.scroll-dot');

// Function to check for text overlap with content
function checkForOverlap() {
  const contentArea = document.querySelector('section');
  const contentRect = contentArea.getBoundingClientRect();
  const contentMiddle = contentRect.left + (contentRect.width / 2);
  
  scrollDots.forEach(dot => {
    const textElement = dot.querySelector('.section-name');
    const textRect = textElement.getBoundingClientRect();
    
    if (textRect.right > contentMiddle - 50) {
      dot.classList.add('overlap');
    } else {
      dot.classList.remove('overlap');
    }
  });
}

// Smooth scroll to section when clicking a dot
scrollDots.forEach(dot => {
  dot.addEventListener('click', (e) => {
    e.preventDefault();
    const targetId = dot.getAttribute('href');
    const targetSection = document.querySelector(targetId);
    
    scrollDots.forEach(d => d.classList.remove('active'));
    dot.classList.add('active');
    
    targetSection.scrollIntoView({
      behavior: 'smooth',
      block: 'center'
    });
  });
});

// Debounce function
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// Function to check which section is in view
function updateActiveSection() {
  const viewportMiddle = window.scrollY + window.innerHeight / 2;
  
  let closestSection = null;
  let closestDistance = Infinity;
  
  sections.forEach(section => {
    const rect = section.getBoundingClientRect();
    const sectionMiddle = section.offsetTop + rect.height / 2;
    const distance = Math.abs(viewportMiddle - sectionMiddle);
    
    if (distance < closestDistance) {
      closestDistance = distance;
      closestSection = section;
    }
  });
  
  if (closestSection) {
    const currentDot = document.querySelector(`.scroll-dot[href="#${closestSection.id}"]`);
    if (currentDot && !currentDot.classList.contains('active')) {
      scrollDots.forEach(dot => dot.classList.remove('active'));
      currentDot.classList.add('active');
      
      // Reset animation
      const oldDot = currentDot.querySelector('.dot');
      const newDot = oldDot.cloneNode(true);
      oldDot.parentNode.replaceChild(newDot, oldDot);
    }
  }
}

// Add event listeners with shorter debounce
window.addEventListener('scroll', debounce(() => {
  updateActiveSection();
  checkForOverlap();
}, 50));

window.addEventListener('resize', debounce(() => {
  updateActiveSection();
  checkForOverlap();
}, 50));

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
  updateActiveSection();
  checkForOverlap();
});

// Update on window resize
window.addEventListener('resize', debounce(updateActiveSection, 50));

// Update mobile nav active state
const updateMobileNav = () => {
  const scrollPosition = window.scrollY;
  const viewportHeight = window.innerHeight;
  const mobileNavLinks = document.querySelectorAll('.mobile-nav a');
  
  sections.forEach((section, index) => {
    const rect = section.getBoundingClientRect();
    if (rect.top <= viewportHeight/2 && rect.bottom >= viewportHeight/2) {
      mobileNavLinks.forEach(link => {
        if (link.getAttribute('href') === '#' + section.id) {
          link.style.color = '#007bff';
        } else {
          link.style.color = '#333';
        }
      });
    }
  });
};

// Add mobile nav update to scroll listener
window.addEventListener('scroll', updateMobileNav);

// Add smooth scrolling to mobile nav
document.querySelectorAll('.mobile-nav a').forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault();
    const targetId = link.getAttribute('href');
    document.querySelector(targetId).scrollIntoView({
      behavior: 'smooth'
    });
  });
});
