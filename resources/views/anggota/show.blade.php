@extends('layouts.app')
 
@section('title', $anggota->nama)
 
@section('content')
<div class="row">
    <div class="col-12 mb-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('anggota.index') }}">Anggota</a></li>
                <li class="breadcrumb-item active">{{ $anggota->nama }}</li>
            </ol>
        </nav>
    </div>
</div>
 
<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">
                    <i class="bi bi-person"></i>
                    Detail Anggota
                </h4>
            </div>
            <div class="card-body">
                <div class="text-center mb-4">
                    @if ($anggota->jenis_kelamin == 'Laki-laki')
                        <i class="bi bi-person-circle text-primary" style="font-size: 5rem;"></i>
                    @else
                        <i class="bi bi-person-circle text-danger" style="font-size: 5rem;"></i>
                    @endif
                    <h3 class="mt-2">{{ $anggota->nama }}</h3>
                    @if ($anggota->status == 'Aktif')
                        <span class="badge bg-success">
                            <i class="bi bi-check-circle"></i> Anggota Aktif
                        </span>
                    @else
                        <span class="badge bg-secondary">
                            <i class="bi bi-x-circle"></i> Nonaktif
                        </span>
                    @endif
                </div>
                
                <table class="table table-borderless">
                    <tr>
                        <td width="200" class="fw-bold">
                            <i class="bi bi-upc text-success"></i> Kode Anggota
                        </td>
                        <td>: <code>{{ $anggota->kode_anggota }}</code></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-envelope text-success"></i> Email
                        </td>
                        <td>: {{ $anggota->email }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-telephone text-success"></i> Telepon
                        </td>
                        <td>: {{ $anggota->telepon }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-geo-alt text-success"></i> Alamat
                        </td>
                        <td>: {{ $anggota->alamat }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-calendar text-success"></i> Tanggal Lahir
                        </td>
                        <td>: {{ $anggota->tanggal_lahir->format('d F Y') }} ({{ $anggota->umur }} tahun)</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-gender-ambiguous text-success"></i> Jenis Kelamin
                        </td>
                        <td>: {{ $anggota->jenis_kelamin }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-briefcase text-success"></i> Pekerjaan
                        </td>
                        <td>: {{ $anggota->pekerjaan ?? '-' }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">
                            <i class="bi bi-calendar-check text-success"></i> Tanggal Daftar
                        </td>
                        <td>: {{ $anggota->tanggal_daftar->format('d F Y') }} ({{ $anggota->lama_anggota }} hari)</td>
                    </tr>
                </table>
                
                <hr>
                <div class="row text-muted small">
                    <div class="col-md-6">
                        <i class="bi bi-clock"></i> 
                        Ditambahkan: {{ $anggota->created_at->format('d M Y H:i') }}
                    </div>
                    <div class="col-md-6 text-end">
                        <i class="bi bi-clock-history"></i> 
                        Terakhir Update: {{ $anggota->updated_at->format('d M Y H:i') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-4">
        <div class="card mb-3">
            <div class="card-header bg-secondary text-white">
                <h6 class="mb-0">
                    <i class="bi bi-gear"></i> Aksi
                </h6>
            </div>
            <div class="card-body d-grid gap-2">
                <a href="{{ route('anggota.edit', $anggota->id) }}" class="btn btn-warning">
                    <i class="bi bi-pencil"></i> Edit Anggota
                </a>
                <a href="{{ route('anggota.index') }}" class="btn btn-outline-success">
                    <i class="bi bi-arrow-left"></i> Kembali
                </a>
                <hr>
                <form action="{{ route('anggota.destroy', $anggota->id) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger w-100">
                        <i class="bi bi-trash"></i> Hapus Anggota
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

{{-- Statistik Peminjaman --}}
<div class="row g-3 mt-2 mb-4">
    <div class="col-12">
        <h4><i class="bi bi-journal-text text-primary"></i> Riwayat Peminjaman</h4>
    </div>
    <div class="col-md-4">
        <div class="card border-primary h-100">
            <div class="card-body d-flex align-items-center">
                <i class="bi bi-journal-arrow-up fs-1 text-primary me-3"></i>
                <div>
                    <h6 class="text-muted mb-1">Total Peminjaman</h6>
                    <h3 class="mb-0">{{ $statsPeminjaman['total_pinjam'] }}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-danger h-100">
            <div class="card-body d-flex align-items-center">
                <i class="bi bi-cash-stack fs-1 text-danger me-3"></i>
                <div>
                    <h6 class="text-muted mb-1">Total Denda</h6>
                    <h3 class="mb-0">Rp {{ number_format($statsPeminjaman['total_denda'], 0, ',', '.') }}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-warning h-100">
            <div class="card-body d-flex align-items-center">
                <i class="bi bi-hourglass-split fs-1 text-warning me-3"></i>
                <div>
                    <h6 class="text-muted mb-1">Masih Dipinjam</h6>
                    <h3 class="mb-0">{{ $statsPeminjaman['masih_dipinjam'] }}</h3>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Filter Status --}}
<div class="mb-3">
    <div class="btn-group" role="group">
        <a href="{{ route('anggota.show', $anggota->id) }}" 
           class="btn {{ !$filterStatus ? 'btn-primary' : 'btn-outline-primary' }}">
            <i class="bi bi-list"></i> Semua
        </a>
        <a href="{{ route('anggota.show', [$anggota->id, 'status' => 'Dipinjam']) }}" 
           class="btn {{ $filterStatus === 'Dipinjam' ? 'btn-warning' : 'btn-outline-warning' }}">
            <i class="bi bi-hourglass-split"></i> Dipinjam
        </a>
        <a href="{{ route('anggota.show', [$anggota->id, 'status' => 'Dikembalikan']) }}" 
           class="btn {{ $filterStatus === 'Dikembalikan' ? 'btn-success' : 'btn-outline-success' }}">
            <i class="bi bi-check-circle"></i> Dikembalikan
        </a>
    </div>
</div>

{{-- Timeline Peminjaman --}}
@if($transaksis->count() > 0)
<div class="timeline-container">
    @foreach($transaksis as $trx)
    <div class="timeline-item">
        <div class="timeline-dot {{ $trx->status === 'Dipinjam' ? ($trx->terlambat > 0 ? 'bg-danger' : 'bg-warning') : 'bg-success' }}"></div>
        <div class="timeline-content">
            <div class="card shadow-sm mb-0 {{ $trx->terlambat > 0 && $trx->status === 'Dipinjam' ? 'border-danger' : '' }}">
                <div class="card-body py-3">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h6 class="mb-1">
                                <i class="bi bi-book me-1"></i>
                                {{ $trx->buku->judul }}
                            </h6>
                            <small class="text-muted">
                                <code>{{ $trx->kode_transaksi }}</code>
                                &middot; Dipinjam: {{ $trx->tanggal_pinjam->format('d M Y') }}
                                &middot; Batas: {{ $trx->tanggal_kembali->format('d M Y') }}
                            </small>
                            @if($trx->status === 'Dikembalikan')
                                <br>
                                <small class="text-muted">
                                    Dikembalikan: {{ $trx->tanggal_dikembalikan->format('d M Y') }}
                                </small>
                            @endif
                        </div>
                        <div class="text-end">
                            @if($trx->status === 'Dipinjam')
                                <span class="badge bg-warning text-dark">Dipinjam</span>
                                @if($trx->terlambat > 0)
                                    <br><span class="badge bg-danger mt-1">Terlambat {{ $trx->terlambat }} hari</span>
                                @endif
                            @else
                                <span class="badge bg-success">Dikembalikan</span>
                                @if($trx->terlambat > 0)
                                    <br><small class="text-danger">Terlambat {{ $trx->terlambat }} hari</small>
                                @endif
                            @endif
                            @if($trx->denda > 0)
                                <br><small class="text-danger fw-bold">Denda: Rp {{ number_format($trx->denda, 0, ',', '.') }}</small>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div>
@else
<div class="card">
    <div class="card-body text-center text-muted py-5">
        <i class="bi bi-journal-x display-4"></i>
        <p class="mt-2 mb-0">
            @if($filterStatus)
                Tidak ada transaksi dengan status "{{ $filterStatus }}"
            @else
                Belum ada riwayat peminjaman
            @endif
        </p>
    </div>
</div>
@endif

@push('styles')
<style>
    .timeline-container {
        position: relative;
        padding-left: 30px;
    }
    .timeline-container::before {
        content: '';
        position: absolute;
        left: 10px;
        top: 0;
        bottom: 0;
        width: 3px;
        background: #dee2e6;
        border-radius: 3px;
    }
    .timeline-item {
        position: relative;
        margin-bottom: 1rem;
    }
    .timeline-dot {
        position: absolute;
        left: -25px;
        top: 18px;
        width: 14px;
        height: 14px;
        border-radius: 50%;
        border: 3px solid #fff;
        box-shadow: 0 0 0 2px #dee2e6;
        z-index: 1;
    }
    .timeline-content {
        padding-left: 10px;
    }
</style>
@endpush
@endsection