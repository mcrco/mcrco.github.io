// Get all sections and scroll dots
const sections = document.querySelectorAll('section');
const scrollDots = document.querySelectorAll('.scroll-dot');

// Add smooth scrolling to scroll dots
scrollDots.forEach(dot => {
    dot.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = dot.getAttribute('href');
        document.querySelector(targetId).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Update active section on scroll
const updateActiveSection = () => {
    const scrollPosition = window.scrollY;
    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;

    // Handle last section (awards)
    if (scrollPosition + windowHeight >= documentHeight - 100) {
        scrollDots.forEach(dot => dot.classList.remove('active'));
        scrollDots[scrollDots.length - 1].classList.add('active');
        return;
    }

    // Handle all other sections
    let activeIndex = -1;
    const viewportTop = scrollPosition;
    const viewportBottom = scrollPosition + windowHeight;
    const viewportCenter = (viewportTop + viewportBottom) / 2;

    // Skip the intro section in the calculation by starting from index 1
    sections.forEach((section, index) => {
        if (index === 0) return; // Skip intro section
        
        const sectionTop = section.offsetTop;
        const sectionHeight = section.offsetHeight;
        const sectionCenter = sectionTop + (sectionHeight / 2);

        // Calculate how close the viewport center is to the section center
        const distanceToSection = Math.abs(viewportCenter - sectionCenter);
        
        // If this is the first section we're checking or it's closer than our current best match
        if (activeIndex === -1 || distanceToSection < Math.abs(viewportCenter - sections[activeIndex + 1].offsetTop - (sections[activeIndex + 1].offsetHeight / 2))) {
            activeIndex = index - 1;
        }
    });

    if (activeIndex !== -1) {
        scrollDots.forEach(dot => dot.classList.remove('active'));
        scrollDots[activeIndex].classList.add('active');
    }
};

// Add scroll event listener
window.addEventListener('scroll', updateActiveSection);

// Initialize active section on page load
document.addEventListener('DOMContentLoaded', updateActiveSection);
