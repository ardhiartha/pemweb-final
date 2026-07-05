<?php
 
namespace App\Http\Controllers;
 
use App\Models\Buku;
use App\Models\Anggota;
use App\Models\Transaksi;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
 
class DashboardController extends Controller
{
    public function index()
    {
        // Statistik utama
        $stats = [
            'total_buku'        => Buku::count(),
            'total_anggota'     => Anggota::where('status', 'Aktif')->count(),
            'total_transaksi'   => Transaksi::count(),
            'sedang_dipinjam'   => Transaksi::where('status', 'Dipinjam')->count(),
            'terlambat'         => Transaksi::where('status', 'Dipinjam')
                                            ->where('tanggal_kembali', '<', now())->count(),
            'denda_bulan_ini'   => Transaksi::whereMonth('tanggal_dikembalikan', now()->month)
                                            ->sum('denda'),
            'transaksi_hari_ini'=> Transaksi::whereDate('tanggal_pinjam', today())->count(),
            'buku_tersedia'     => Buku::where('stok', '>', 0)->count(),
        ];
 
        // Data chart: transaksi 6 bulan terakhir (Line chart)
        $chartData = collect(range(5, 0))->map(function ($i) {
            $date = now()->subMonths($i);
            return [
                'bulan' => $date->translatedFormat('M Y'),
                'pinjam' => Transaksi::whereMonth('tanggal_pinjam', $date->month)
                                     ->whereYear('tanggal_pinjam', $date->year)->count(),
                'kembali' => Transaksi::whereMonth('tanggal_dikembalikan', $date->month)
                                      ->whereYear('tanggal_dikembalikan', $date->year)->count(),
            ];
        });
 
        // Top 5 buku populer (untuk backward compat)
        $bukuPopuler = Buku::withCount('transaksis')
                           ->orderByDesc('transaksis_count')
                           ->take(5)->get();
 
        // Top 10 buku populer (Bar chart)
        $top10BukuPopuler = Buku::withCount('transaksis')
                                ->orderByDesc('transaksis_count')
                                ->take(10)->get();
 
        // Top 5 anggota aktif
        $anggotaAktif = Anggota::withCount('transaksis')
                               ->orderByDesc('transaksis_count')
                               ->take(5)->get();
 
        // Transaksi terbaru
        $recentTransaksi = Transaksi::with(['anggota', 'buku'])
                                    ->latest()->take(5)->get();
 
        // Pie chart: kategori buku
        $kategoriBuku = Buku::select('kategori', DB::raw('count(*) as total'))
                            ->groupBy('kategori')
                            ->orderByDesc('total')
                            ->get();
 
        // Donut chart: status transaksi
        $statusTransaksi = Transaksi::select('status', DB::raw('count(*) as total'))
                                    ->groupBy('status')
                                    ->get();
 
        // Daftar transaksi terlambat (untuk widget)
        $transaksiTerlambat = Transaksi::with(['anggota', 'buku'])
                                       ->where('status', 'Dipinjam')
                                       ->where('tanggal_kembali', '<', now())
                                       ->orderBy('tanggal_kembali')
                                       ->get();
 
        return view('dashboard', compact(
            'stats', 'chartData', 'bukuPopuler', 'top10BukuPopuler',
            'anggotaAktif', 'recentTransaksi',
            'kategoriBuku', 'statusTransaksi', 'transaksiTerlambat'
        ));
    }
}