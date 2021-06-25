clc;clear;
%Membersihkan jendela command windows

opts = detectImportOptions('Real estate valuation data set.xlsx');
opts.SelectedVariableNames = [3:5 8];
data = readmatrix('Real estate valuation data set.xlsx',opts);
%Pengambilan data

x = data(1:50,:);
%variable x sebagai data rating kecocokan dari masing-masing alternatif
k = [0 0 1 0];
%atribut tiap-tiap kriteria, dimana nilai 1 = keuntungan, dan 0 = biaya
w = [3 5 4 1];
%Nilai bobot tiap kriteria (1=sangat buruk, 2=buruk, 3=cukup, 4=tinggi, 5=sangat tinggi)


%tahapan pertama, perbaikan bobot
[m n] = size(x);
%inisialisasi ukuran x
w=w./sum(w);
%membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
    if k(j)==0, w(j)=-1*w(j);
    end;
end
for i=1:m
        S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V = S/sum(S);
[poin no] = sort(V,'descend');

%pengurutan data
maks = max(V);
for i = 1:5
    rank = ['Ranking ', num2str(i), ' adalah data no-', num2str(no(i)), ' dengan poin (', num2str(poin(i)),')'];
    disp(rank);
end;
    fprintf('Nilai maksimal : %g', maks);



