scheme = "Goodwin_AW.zcos";

// Simulate
importXcosDiagram(scheme);

// Goodwin AW
ctx = ["m = 10; k = 0.5; kp = 1; ki = 0.2; kd = 5; tau = 1; stp = 100; std_noise = 1; sat = 50; Fd = 10; pid_en = 0;"];
scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);
z_out_gd = z_out;
u_out_gd = u_out;

// No AW
ctx = ["m = 10; k = 0.5; kp = 1; ki = 0.2; kd = 5; tau = 1; stp = 100; std_noise = 1; sat = 50; Fd = 10; pid_en = 1;"];
scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);

// Draw
subplot(212);
h = plot(z_out.time, z_out.values, 'r-', z_out_gd.time, z_out_gd.values, 'g-', stp_out.time, stp_out.values, 'b-', 'LineWidth',3);
l = legend("Response no AW", "Response Goodwin AW", "Setpoint");
l.font_size = 4;
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 0;50 200];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 4);
ylabel('Position [m]', 'font_style', 'times bold', 'font_size', 4);

subplot(211);
h = plot(u_out.time, u_out.values, 'r-', u_out_gd.time, u_out_gd.values, 'g-', 'LineWidth',3);
l = legend("Command no AW", "Command Goodwin AW", "Setpoint");
l.font_size = 4;
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 -100;50 100];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 4);
ylabel('F[N]', 'font_style', 'times bold', 'font_size', 4);
