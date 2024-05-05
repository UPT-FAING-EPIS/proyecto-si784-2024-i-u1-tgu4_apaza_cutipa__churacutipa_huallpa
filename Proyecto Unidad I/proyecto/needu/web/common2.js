<script>
        document.addEventListener("DOMContentLoaded", function() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                }
            });
        }, {
            rootMargin: "0px",
            threshold: 0.1
        });

        const oportunidades = document.querySelectorAll('.card-oportunidad');
        oportunidades.forEach(opo => {
            observer.observe(opo);
        });
    });
    </script>