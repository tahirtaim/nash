<!-- Libs JS -->
<script src="{{ asset('backend') }}/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('backend') }}/assets/libs/feather-icons/dist/feather.min.js"></script>
<script src="{{ asset('backend') }}/assets/libs/simplebar/dist/simplebar.min.js"></script>
<script src="{{ asset('backend') }}/assets/libs/apexcharts/dist/apexcharts.min.js"></script>

<!-- Theme JS -->
<script src="{{ asset('backend') }}/assets/js/theme.min.js"></script>

<!-- jQuery + Plugins CDN -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- DataTables Buttons JS -->
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>

<!-- JSZip for Excel export -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<!-- Select2 JS -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Custom Scripts -->
<script>
    $(document).ready(function() {
        // Delete confirmation
        $(document).on('click', '.btn-delete', function(e) {
            e.preventDefault();
            const url = $(this).data('url');
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = url;
                }
            });
        });

        // SweetAlert Toast
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
            }
        });

        @if (session('success'))
            Toast.fire({
                icon: "success",
                title: "{{ session('success') }}"
            });
        @endif

        @if (session('error'))
            Toast.fire({
                icon: "error",
                title: "{{ session('error') }}"
            });
        @endif


        $('.select2').select2({
            placeholder: "Select an option",
            allowClear: true
        });



    });
</script>

{{-- change form direction and input field direction --}}
<script>
    function changeFormDirection(selectElement) {
        const form = selectElement.closest('.form-direction'); // Find the closest .form-direction div
        const inputs = form.querySelectorAll('input, textarea, select'); // Select all input fields within the form
        const languageId = selectElement.value;

        if (languageId == 2) { // Arabic (language_id 2)
            form.setAttribute('dir', 'rtl');
            inputs.forEach(input => {
                input.style.textAlign = 'right';
                input.style.direction = 'rtl';
            });

            // ⭐ Fix Select2 direction
            $('.select2').select2({
                dir: "rtl"
            });
        } else { // Default LTR (English or other languages)
            form.setAttribute('dir', 'ltr');
            inputs.forEach(input => {
                input.style.textAlign = 'left';
                input.style.direction = 'ltr';
            });
            // ⭐ Reset Select2 direction to LTR
            $('.select2').select2({
                dir: "ltr"
            });
        }
    }

    // Set the initial direction based on the selected language when the page loads
    document.addEventListener("DOMContentLoaded", function() {
        const languageSelect = document.querySelector('select[name="language_id"]');
        if (languageSelect) {
            changeFormDirection(languageSelect); // Set initial direction
        }
    });
</script>
