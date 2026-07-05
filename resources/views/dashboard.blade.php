@extends('layouts.app')
@section('title', 'Dashboard')
 
@section('content')
<div class="container-fluid py-4">
    <h2 class="mb-4">Dashboard Perpustakaan</h2>
 
    {{-- Statistics Cards --}}
    <div class="row g-3 mb-4">
        @foreach([
            ['Total Buku', $stats['total_buku'], 'bi-book', 'primary'],
            ['Anggota Aktif', $stats['total_anggota'], 'bi-people', 'success'],
            ['Sedang Dipinjam', $stats['sedang_dipinjam'], 'bi-journal-arrow-up', 'info'],
            ['Terlambat', $stats['terlambat'], 'bi-exclamation-triangle', 'danger'],
            ['Transaksi Hari Ini', $stats['transaksi_hari_ini'], 'bi-calendar-check', 'warning'],
            ['Buku Tersedia', $stats['buku_tersedia'], 'bi-bookshelf', 'secondary'],
            ['Total Transaksi', $stats['total_transaksi'], 'bi-receipt', 'dark'],
            ['Denda Bulan Ini', 'Rp ' . number_format($stats['denda_bulan_ini'], 0, ',', '.'), 'bi-cash', 'danger'],
        ] as [$label, $value, $icon, $color])
        <div class="col-xl-3 col-md-6">
            <div class="card border-{{ $color }} h-100">
                <div class="card-body d-flex align-items-center">
                    <i class="bi {{ $icon }} fs-1 text-{{ $color }} me-3"></i>
                    <div>
                        <h6 class="text-muted mb-1">{{ $label }}</h6>
                        <h4 class="mb-0">{{ $value }}</h4>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    {{-- Quick Actions --}}
    <div class="row g-3 mb-4">
        <div class="col-12">
            <h5 class="mb-3"><i class="bi bi-lightning-charge-fill text-warning"></i> Quick Actions</h5>
        </div>
        @foreach([
            ['Kelola Buku', 'Manajemen koleksi buku perpustakaan', 'bi-book', 'primary', 'buku.index'],
            ['Kelola Anggota', 'Manajemen data anggota perpustakaan', 'bi-people', 'success', 'anggota.index'],
            ['Transaksi', 'Peminjaman dan pengembalian buku', 'bi-arrow-left-right', 'info', 'transaksi.index'],
            ['Tambah Buku', 'Tambah buku baru ke koleksi', 'bi-plus-circle', 'primary', 'buku.create'],
            ['Tambah Anggota', 'Daftarkan anggota baru', 'bi-person-plus', 'success', 'anggota.create'],
            ['Pinjam Buku', 'Buat transaksi peminjaman baru', 'bi-journal-plus', 'warning', 'transaksi.create'],
        ] as [$title, $desc, $icon, $color, $route])
        <div class="col-xl-2 col-md-4 col-sm-6">
            <a href="{{ route($route) }}" class="text-decoration-none">
                <div class="card border-{{ $color }} h-100 shadow-sm quick-action-card">
                    <div class="card-body text-center py-4">
                        <i class="bi {{ $icon }} display-4 text-{{ $color }}"></i>
                        <h6 class="card-title mt-2 mb-1 text-dark">{{ $title }}</h6>
                        <small class="text-muted">{{ $desc }}</small>
                    </div>
                </div>
            </a>
        </div>
        @endforeach
    </div>
 
    {{-- Charts Row 1: Pie Kategori + Bar Top 10 --}}
    <div class="row mb-4">
        <div class="col-lg-5">
            <div class="card h-100">
                <div class="card-header">
                    <i class="bi bi-pie-chart-fill text-primary"></i> Distribusi Kategori Buku
                </div>
                <div class="card-body d-flex align-items-center justify-content-center">
                    <canvas id="chartKategori"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="card h-100">
                <div class="card-header">
                    <i class="bi bi-bar-chart-fill text-success"></i> Top 10 Buku Terpopuler
                </div>
                <div class="card-body">
                    <canvas id="chartTop10Buku" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>

    {{-- Charts Row 2: Line Trend + Donut Status --}}
    <div class="row mb-4">
        <div class="col-lg-8">
            <div class="card h-100">
                <div class="card-header">
                    <i class="bi bi-graph-up text-info"></i> Trend Peminjaman 6 Bulan Terakhir
                </div>
                <div class="card-body">
                    <canvas id="chartTransaksi" height="100"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card h-100">
                <div class="card-header">
                    <i class="bi bi-circle-half text-warning"></i> Status Transaksi
                </div>
                <div class="card-body d-flex align-items-center justify-content-center">
                    <canvas id="chartStatus"></canvas>
                </div>
            </div>
        </div>
    </div>

    {{-- Widget Buku Terlambat --}}
    @if($transaksiTerlambat->count() > 0)
    <div class="row mb-4">
        <div class="col-12">
            <div class="card border-danger">
                <div class="card-header bg-danger text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">
                        <i class="bi bi-exclamation-triangle-fill"></i> Buku Terlambat
                        <span class="badge bg-light text-danger ms-2">{{ $transaksiTerlambat->count() }} transaksi</span>
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>No</th>
                                    <th>Kode Transaksi</th>
                                    <th>Anggota</th>
                                    <th>Buku</th>
                                    <th>Batas Kembali</th>
                                    <th>Keterlambatan</th>
                                    <th>Estimasi Denda</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($transaksiTerlambat as $trx)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td><code>{{ $trx->kode_transaksi }}</code></td>
                                    <td>
                                        <i class="bi bi-person-fill text-muted"></i>
                                        {{ $trx->anggota->nama }}
                                    </td>
                                    <td>{{ $trx->buku->judul }}</td>
                                    <td>{{ $trx->tanggal_kembali->format('d M Y') }}</td>
                                    <td>
                                        <span class="badge bg-danger">
                                            <i class="bi bi-exclamation-circle"></i>
                                            Terlambat {{ $trx->terlambat }} hari
                                        </span>
                                    </td>
                                    <td class="text-danger fw-bold">
                                        Rp {{ number_format($trx->terlambat * 5000, 0, ',', '.') }}
                                    </td>
                                    <td>
                                        <a href="{{ route('transaksi.show', $trx->id) }}" class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-eye"></i> Detail
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif

    {{-- Recent Transactions --}}
    <div class="card">
        <div class="card-header">Transaksi Terbaru</div>
        <div class="card-body table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Kode</th><th>Anggota</th><th>Buku</th>
                        <th>Tgl Pinjam</th><th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($recentTransaksi as $trx)
                    <tr>
                        <td>{{ $trx->kode_transaksi }}</td>
                        <td>{{ $trx->anggota->nama }}</td>
                        <td>{{ $trx->buku->judul }}</td>
                        <td>{{ $trx->tanggal_pinjam->format('d/m/Y') }}</td>
                        <td>
                            <span class="badge bg-{{ $trx->status === 'Dipinjam' ? 'warning' : 'success' }}">
                                {{ $trx->status }}
                            </span>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
 
@push('styles')
<style>
    .quick-action-card {
        transition: all 0.3s ease;
        cursor: pointer;
    }
    .quick-action-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 0.5rem 1rem rgba(0,0,0,.15) !important;
    }
</style>
@endpush

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
// === 1. Pie Chart — Distribusi Kategori Buku ===
new Chart(document.getElementById('chartKategori'), {
    type: 'pie',
    data: {
        labels: @json($kategoriBuku->pluck('kategori')),
        datasets: [{
            data: @json($kategoriBuku->pluck('total')),
            backgroundColor: [
                '#0d6efd', '#198754', '#ffc107', '#dc3545', '#6f42c1',
                '#0dcaf0', '#fd7e14', '#20c997', '#d63384', '#6c757d'
            ]
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'bottom' }
        }
    }
});

// === 2. Bar Chart — Top 10 Buku Terpopuler ===
new Chart(document.getElementById('chartTop10Buku'), {
    type: 'bar',
    data: {
        labels: @json($top10BukuPopuler->pluck('judul')->map(fn($j) => strlen($j) > 25 ? substr($j, 0, 25) . '...' : $j)),
        datasets: [{
            label: 'Jumlah Peminjaman',
            data: @json($top10BukuPopuler->pluck('transaksis_count')),
            backgroundColor: 'rgba(25, 135, 84, 0.7)',
            borderColor: '#198754',
            borderWidth: 1,
            borderRadius: 4
        }]
    },
    options: {
        indexAxis: 'y',
        responsive: true,
        plugins: {
            legend: { display: false }
        },
        scales: {
            x: { beginAtZero: true, ticks: { stepSize: 1 } }
        }
    }
});

// === 3. Line Chart — Trend Peminjaman 6 Bulan ===
new Chart(document.getElementById('chartTransaksi'), {
    type: 'line',
    data: {
        labels: @json($chartData->pluck('bulan')),
        datasets: [
            {
                label: 'Peminjaman',
                data: @json($chartData->pluck('pinjam')),
                borderColor: '#0d6efd',
                backgroundColor: 'rgba(13, 110, 253, 0.1)',
                tension: 0.3,
                fill: true
            },
            {
                label: 'Pengembalian',
                data: @json($chartData->pluck('kembali')),
                borderColor: '#198754',
                backgroundColor: 'rgba(25, 135, 84, 0.1)',
                tension: 0.3,
                fill: true
            }
        ]
    },
    options: { responsive: true }
});

// === 4. Donut Chart — Status Transaksi ===
new Chart(document.getElementById('chartStatus'), {
    type: 'doughnut',
    data: {
        labels: @json($statusTransaksi->pluck('status')),
        datasets: [{
            data: @json($statusTransaksi->pluck('total')),
            backgroundColor: ['#ffc107', '#198754'],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        cutout: '60%',
        plugins: {
            legend: { position: 'bottom' }
        }
    }
});
</script>
@endpush
@endsection