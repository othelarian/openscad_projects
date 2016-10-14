// arcs.scad ####################################

function demi_arc (h,w,n,offset) =
    let(
        hyp_bow = sqrt(h*h+w*w),
        r_bow = (hyp_bow/2) / (h/hyp_bow),
        u_bow = r_bow-offset,
        ang_bow = (90 - acos(h/hyp_bow)) *2
    )
    [
        for (i=[1:n-1])
        let (ang = 90 - (ang_bow/n)*i)
        [cos(ang)*r_bow,sin(ang)*r_bow-u_bow]
    ];

