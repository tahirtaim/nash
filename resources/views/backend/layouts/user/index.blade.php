@extends('backend.master')

@section('title', 'User Management')

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12 mb-4">
            <h3 class="mb-0">{{ isset($user) ? 'Edit User' : 'Add User' }}</h3>
        </div>
    </div>

    <div class="row">

        {{-- User List --}}
        <div class="col-lg-12 col-12">
            <div class="card mb-4">
                <div class="card-header">
                    <label class="form-label fw-bold mb-0">User List</label>
                </div>
                <div class="card-body">
                    <div class="table-responsive table-card">
                        <table id="usersTable" class="table table-striped table-hover align-middle text-nowrap">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 42px;">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="checkAllUsers">
                                        </div>
                                    </th>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th style="min-width: 130px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- Data populated by DataTables --}}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        // Preview Image
        document.getElementById('photoInput').addEventListener('change', function(event) {
            const previewContainer = document.getElementById('newPhotoPreview');
            const previewImage = document.getElementById('previewImage');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = e => {
                    previewImage.src = e.target.result;
                    previewContainer.style.display = 'block';
                }
                reader.readAsDataURL(file);
            } else {
                previewContainer.style.display = 'none';
            }
        });

        // DataTable Init
        $(function() {
            $('#usersTable').DataTable({
                processing: true,
                serverSide: true,
                searching: false,
                ordering: false,
                paging: false,
                lengthChange: false,
                info: false,

                ajax: '{{ route('user.index') }}',
                columns: [{
                        data: 'checkbox',
                        name: 'checkbox',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex'
                    },

                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'email',
                        name: 'email'
                    },

                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
        });
    </script>
@endpush
