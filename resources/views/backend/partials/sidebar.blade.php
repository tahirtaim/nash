<!-- navbar vertical -->
<div class="app-menu">
    <div class="navbar-vertical navbar nav-dashboard">
        <div class="h-100" data-simplebar>
            <!-- Brand logo -->
            <a class="navbar-brand" href="{{ route('dashboard') }}">
                <img src="{{ isset($admin_setting->logo) ? asset($admin_setting->logo) : asset('uploads/logo.png') }}"
                    alt="Logo" class="img-fluid" />
            </a>

            <!-- Navbar nav -->
            <ul class="navbar-nav flex-column" id="sideNavbar">

                <!-- Dashboard -->
                @can('dashboard view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
                            href="{{ route('dashboard') }}">
                            <i data-feather="bar-chart-2" class="nav-icon me-2 icon-xxs"></i>
                            Dashboard
                        </a>
                    </li>
                @endcan

                <!-- Banner -->
                @canany(['banner view', 'banner create', 'banner edit', 'banner delete', 'banner status'])
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('banner.*') ? 'active' : '' }}"
                            href="{{ route('banner.index') }}">
                            <i data-feather="image" class="nav-icon me-2 icon-xxs"></i>
                            Banner
                        </a>
                    </li>
                @endcanany

                <!-- slider -->
                @canany(['banner view', 'banner create', 'banner edit', 'banner delete', 'banner status'])
                    <li class="nav-item">
                        <a href="{{ route('slider.index') }}" class="nav-link">
                            <i data-feather="sliders" class="nav-icon me-2 icon-xxs"></i>
                            <span>Sliders</span>
                        </a>
                    </li>
                @endcanany

                <!-- Product Management -->

                <li class="nav-item {{ request()->routeIs('product.*', 'category.*', 'promocode.*') ? 'active' : '' }}">
                    @canany(['product view', 'promocode view', 'category view'])
                        <a class="nav-link has-arrow" href="#productCollapse" data-bs-toggle="collapse"
                            aria-expanded="{{ request()->routeIs('product.*', 'category.*', 'promocode.*') ? 'true' : 'false' }}">
                            <i data-feather="box" class="nav-icon me-2 icon-xxs"></i>
                            Product Management
                        </a>
                    @endcanany

                    <div id="productCollapse"
                        class="collapse {{ request()->routeIs('product.*', 'category.*', 'promocode.*') ? 'show' : '' }}">
                        <ul class="nav flex-column ms-3">
                            @can('product view')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('product.index') ? 'active' : '' }}"
                                        href="{{ route('product.index') }}">Product List</a>
                                </li>
                            @endcan

                            @can('category view')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('category.index') ? 'active' : '' }}"
                                        href="{{ route('category.index') }}">Category List</a>
                                </li>
                            @endcan

                            @can('promocode view')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('promocode.index') ? 'active' : '' }}"
                                        href="{{ route('promocode.index') }}">PromoCode List</a>
                                </li>
                            @endcan

                        </ul>
                    </div>
                </li>

                <!-- Orders -->
                @can('order view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('order.*') ? 'active' : '' }}"
                            href="{{ route('order.index') }}">
                            <i data-feather="shopping-cart" class="nav-icon me-2 icon-xxs"></i>
                            Orders
                        </a>
                    </li>
                @endcan

                <!-- Offer -->
                @can('offer view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('offer.*') ? 'active' : '' }}"
                            href="{{ route('offer.index') }}">
                            <i data-feather="tag" class="nav-icon me-2 icon-xxs"></i>
                            Offer
                        </a>
                    </li>
                @endcan
                <!-- Review Management -->

                <li class="nav-item {{ request()->routeIs('review.*', 'users.create.review') ? 'active' : '' }}">
                    @canany(['review view'])
                        <a class="nav-link has-arrow" href="#reviewCollapse" data-bs-toggle="collapse"
                            aria-expanded="{{ request()->routeIs('review.*', 'users.create.review') ? 'true' : 'false' }}">
                            <i data-feather="star" class="nav-icon me-2 icon-xxs"></i>
                            Review Management
                        </a>
                    @endcanany
                    @can('review create')
                        <div id="reviewCollapse"
                            class="collapse {{ request()->routeIs('review.*', 'users.create.review') ? 'show' : '' }}">
                            <ul class="nav flex-column ms-3">
                                @can('review create')
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->routeIs('review.index') ? 'active' : '' }}"
                                            href="{{ route('review.index') }}">Admin Review List</a>
                                    </li>
                                @endcan
                                @can('review view')
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->routeIs('users.create.review') ? 'active' : '' }}"
                                            href="{{ route('users.create.review') }}">User Review List</a>
                                    </li>
                                @endcan



                            </ul>
                        </div>
                    @endcan
                </li>


                <!-- Blog -->
                @can('blog view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('blog.*') ? 'active' : '' }}"
                            href="{{ route('blog.index') }}">
                            <i data-feather="book-open" class="nav-icon me-2 icon-xxs"></i>
                            Blog
                        </a>
                    </li>
                @endcan


                <!-- Video -->
                @can('video view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('video.*') ? 'active' : '' }}"
                            href="{{ route('video.index') }}">
                            <i data-feather="video" class="nav-icon me-2 icon-xxs"></i>
                            Video
                        </a>
                    </li>
                @endcan

                <!-- Newsletter -->
                @can('newsletter management')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('get.newsletter.*') ? 'active' : '' }}"
                            href="{{ route('get.newsletter.index') }}">
                            <i data-feather="mail" class="nav-icon me-2 icon-xxs"></i>
                            Newsletter
                        </a>
                    </li>
                @endcan

                <!-- About Us Pages -->
                {{-- @can('dynamic-pages view') --}}
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('aboutus-settings.*') ? 'active' : '' }}"
                            href="{{ route('aboutus.edit') }}">
                            <i class="bi bi-file-earmark-text fs-4 me-2"></i>
                            About Us Page Content
                        </a>
                    </li>
                {{-- @endcan --}}

                <!-- Dynamic Pages -->
                @can('dynamic-pages view')
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('dynamic-pages.*') ? 'active' : '' }}"
                            href="{{ route('dynamic-pages.index') }}">
                            <i class="bi bi-file-earmark-text fs-4 me-2"></i>
                            Dynamic Pages
                        </a>
                    </li>
                @endcan


                <!-- Role Management -->
                <li class="nav-item {{ request()->routeIs('user.*', 'role.*', 'permission.*') ? 'active' : '' }}">
                    @canany(['role management', 'user view', 'permission view', 'role view'])
                        <a class="nav-link has-arrow" href="#roleCollapse" data-bs-toggle="collapse"
                            aria-expanded="{{ request()->routeIs('user.*', 'role.*', 'permission.*') ? 'true' : 'false' }}">
                            <i data-feather="shield" class="nav-icon me-2 icon-xxs"></i>
                            Role Management
                        </a>
                    @endcanany

                    <div id="roleCollapse"
                        class="collapse {{ request()->routeIs('user.*', 'role.*', 'permission.*') ? 'show' : '' }}">
                        <ul class="nav flex-column ms-3">
                            @can('user view')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('user.*') ? 'active' : '' }}"
                                        href="{{ route('user.index') }}">Admin Users</a>
                                </li>
                            @endcan
                            @can('role management')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('role.*') ? 'active' : '' }}"
                                        href="{{ route('role.index') }}">Assign Roles</a>
                                </li>
                            @endcan
                            {{-- @can('permission view')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('permission.*') ? 'active' : '' }}"
                                        href="{{ route('permission.index') }}">Permissions</a>
                                </li>
                            @endcan --}}


                        </ul>
                    </div>
                </li>

                <!-- Settings -->

                <li
                    class="nav-item {{ request()->routeIs('profile.*', 'system.*', 'admin.*', 'mail.*') ? 'active' : '' }}">
                    @canany([
                        'mail setting update',
                        'profile setting update',
                        'system setting update',
                        'admin setting
                        update',
                        ])
                        <a class="nav-link has-arrow" href="#settingsCollapse" data-bs-toggle="collapse"
                            aria-expanded="{{ request()->routeIs('profile.*', 'system.*', 'admin.*', 'mail.*') ? 'true' : 'false' }}">
                            <i data-feather="settings" class="nav-icon me-2 icon-xxs"></i>
                            Settings
                        </a>
                    @endcanany
                    <div id="settingsCollapse"
                        class="collapse {{ request()->routeIs('profile.*', 'system.*', 'admin.*', 'mail.*') ? 'show' : '' }}">
                        <ul class="nav flex-column ms-3">
                            @can('profile setting update')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('profile.*') ? 'active' : '' }}"
                                        href="{{ route('profile.index') }}">Profile Setting</a>
                                </li>
                            @endcan

                            @can('system setting update')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('system.*') ? 'active' : '' }}"
                                        href="{{ route('system.index') }}">System Setting</a>
                                </li>
                            @endcan

                            @can('admin setting update')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('admin.*') ? 'active' : '' }}"
                                        href="{{ route('admin.setting.index') }}">Admin Setting</a>
                                </li>
                            @endcan
                            @can('mail setting update')
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('mail.*') ? 'active' : '' }}"
                                        href="{{ route('mail.index') }}">Mail Setting</a>
                                </li>
                            @endcan
                        </ul>
                    </div>
                </li>

                <!-- Logout -->
                <li class="nav-item">
                    <a class="nav-link" href="#"
                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i data-feather="log-out" class="nav-icon me-2 icon-xxs"></i>
                        Logout
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </li>

            </ul>
        </div>
    </div>
</div>
