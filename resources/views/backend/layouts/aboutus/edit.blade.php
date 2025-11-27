@extends('backend.master')

@section('title', 'About Us')

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between bg-galaxy-transparent">
                {{-- <h4 class="mb-sm-0" style="margin-left: 300px">About Us Settings</h4> --}}
            </div>
        </div>
    </div>

    <div class="row justify-content-center mt-3">
        <div class="col-lg-8">
            <div class="card">

                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title mb-0">About Us Content</h4>

                    <select id="aboutLangSwitcher" class="form-select w-auto">
                        @foreach ($languages as $lang)
                            <option value="{{ $lang->id }}" {{ $lang->id == $defaultLang->id ? 'selected' : '' }}>
                                {{ $lang->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <form id="aboutForm">
                    @csrf
                    <div class="card-body form-direction" id="formDirectionContainer">
                        <!-- Welcome -->
                        <div class="mb-3">
                            <label class="form-label">Welcome Title</label>
                            <input type="text" name="welcome_title" id="welcome_title" class="form-control">
                            <span class="text-danger welcome_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Welcome Description</label>
                            <textarea name="welcome_description" id="welcome_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger welcome_description_error"></span>
                        </div>

                        <!-- Story -->
                        <div class="mb-3">
                            <label class="form-label">Story Title</label>
                            <input type="text" name="story_title" id="story_title" class="form-control">
                            <span class="text-danger story_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Story Description</label>
                            <textarea name="story_description" id="story_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger story_description_error"></span>
                        </div>

                        <!-- Philosophy -->
                        <div class="mb-3">
                            <label class="form-label">Philosophy Title</label>
                            <input type="text" name="philosophy_title" id="philosophy_title" class="form-control">
                            <span class="text-danger philosophy_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Philosophy Description</label>
                            <textarea name="philosophy_description" id="philosophy_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger philosophy_description_error"></span>
                        </div>

                        <!-- Product -->
                        <div class="mb-3">
                            <label class="form-label">Product Title</label>
                            <input type="text" name="product_title" id="product_title" class="form-control">
                            <span class="text-danger product_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Product Description</label>
                            <textarea name="product_description" id="product_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger product_description_error"></span>
                        </div>

                        <!-- Community -->
                        <div class="mb-3">
                            <label class="form-label">Community Title</label>
                            <input type="text" name="community_title" id="community_title" class="form-control">
                            <span class="text-danger community_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Community Description</label>
                            <textarea name="community_description" id="community_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger community_description_error"></span>
                        </div>

                        <!-- Touch -->
                        <div class="mb-3">
                            <label class="form-label">Touch Title</label>
                            <input type="text" name="touch_title" id="touch_title" class="form-control">
                            <span class="text-danger touch_title_error"></span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Touch Description</label>
                            <textarea name="touch_description" id="touch_description" rows="3" class="form-control"></textarea>
                            <span class="text-danger touch_description_error"></span>
                        </div>

                        <!-- Status -->
                        <div class="mb-3">
                            <label>Status</label>
                            <select name="status" id="status" class="form-select">
                                <option value="1">Published</option>
                                <option value="0">Unpublished</option>
                            </select>
                            <span class="text-danger status_error"></span>
                        </div>

                        <button type="submit" class="btn btn-primary mt-3">Update</button>

                    </div>
                </form>

            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {

            let currentLang = $("#aboutLangSwitcher").val();

            function resetErrors() {
                $(".text-danger").text("");
            }

            // Load Data
            function loadAboutData(langId) {
                $.get("{{ url('aboutus-settings') }}/" + langId, function(res) {

                    if (res.success && res.data) {
                        let d = res.data;

                        $('#welcome_title').val(d.welcome_title);
                        $('#welcome_description').val(d.welcome_description);

                        $('#story_title').val(d.story_title);
                        $('#story_description').val(d.story_description);

                        $('#philosophy_title').val(d.philosophy_title);
                        $('#philosophy_description').val(d.philosophy_description);

                        $('#product_title').val(d.product_title);
                        $('#product_description').val(d.product_description);

                        $('#community_title').val(d.community_title);
                        $('#community_description').val(d.community_description);

                        $('#touch_title').val(d.touch_title);
                        $('#touch_description').val(d.touch_description);

                        $('#status').val(d.status);

                    } else {
                        $('#aboutForm')[0].reset();
                    }
                });
            }

            loadAboutData(currentLang);

            $('#aboutLangSwitcher').on('change', function() {
                currentLang = $(this).val();
                resetErrors();
                loadAboutData(currentLang);
                applyDirection(currentLang);
            });

            // Submit Update
            $('#aboutForm').on('submit', function(e) {
                e.preventDefault();
                resetErrors();

                let formData = new FormData(this);

                $.ajax({
                    url: "{{ url('aboutus-settings/update') }}/" + currentLang,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,

                    beforeSend: function() {
                        Swal.fire({
                            title: 'Updating...',
                            text: 'Please wait...',
                            allowOutsideClick: false,
                            didOpen: () => Swal.showLoading()
                        });
                    },

                    success: function(res) {
                        Swal.close();

                        Swal.fire({
                            toast: true,
                            position: 'top-end',
                            icon: 'success',
                            text: res.message,
                            timer: 3000,
                            showConfirmButton: false
                        });

                        loadAboutData(currentLang);
                    },

                    error: function(xhr) {
                        Swal.close();
                        if (xhr.status === 422) {
                            $.each(xhr.responseJSON.errors, function(key, value) {
                                $("." + key + "_error").text(value[0]);
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                text: "Server Error: " + xhr.statusText
                            });
                        }
                    }
                });

            });

        });
    </script>
    <script>
        function applyDirection(languageId) {
            const formContainer = document.getElementById("formDirectionContainer");
            const inputs = formContainer.querySelectorAll("input, textarea, select");

            if (languageId == 2) { // Arabic
                formContainer.setAttribute("dir", "rtl");

                inputs.forEach(input => {
                    input.style.textAlign = "right";
                    input.style.direction = "rtl";
                });

                // Select2 RTL fix
                $('.select2').select2({
                    dir: "rtl"
                });

            } else { // English + Other languages
                formContainer.setAttribute("dir", "ltr");

                inputs.forEach(input => {
                    input.style.textAlign = "left";
                    input.style.direction = "ltr";
                });

                $('.select2').select2({
                    dir: "ltr"
                });
            }
        }

        // Trigger when dropdown changes
        $('#aboutLangSwitcher').on('change', function() {
            applyDirection($(this).val());
        });

        // Trigger on initial page load
        $(document).ready(function() {
            applyDirection($("#aboutLangSwitcher").val());
        });
    </script>
@endpush
