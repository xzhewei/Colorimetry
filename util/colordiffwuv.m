function DE = colordiffwuv(Wr,Ur,Vr,Wt,Ut,Vt)
    DE = sqrt((Wr - Wt).^2 + (Ur-Ut).^2 + (Vr-Vt).^2);
end