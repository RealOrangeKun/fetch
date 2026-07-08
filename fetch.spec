Name:           fetch
Version:        1.0.0
Release:        1%{?dist}
Summary:        Animated 3D fetch tool for your terminal

License:        MIT
URL:            https://github.com/areofyl/fetch
Source0:        %{url}/archive/refs/heads/main.tar.gz#/fetch-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make

%description
A donut.c-inspired fetch tool that spins your distro logo in 3D with live-updating
system info. Takes any ASCII/Unicode distro logo, turns each character into a point
cloud based on its visual density, and renders it as a rotating 3D relief with
Blinn-Phong shading. System info is gathered natively from /proc, /sys, and GTK
config — no external dependencies required.

%prep
%autosetup -n fetch-main

%build
%make_build

%install
%make_install DESTDIR=%{buildroot} PREFIX=%{_prefix}

%files
%doc README.md
%license LICENSE
%{_bindir}/fetch

%changelog
* Mon Jun 09 2025 Youssef Tarek <amazingritro66@gmail.com> - 1.0.0-1
- Initial RPM package for Fedora
