TriOsc tri => LPF l0 => Gain g0 => dac;
SawOsc saw => LPF l1 => Envelope e => Gain g1 => dac;

5 => l0.Q;
5 => l1.Q;

2 => g0.gain;
0.3 => g1.gain;

fun void low() {
	while(true) {
		Math.random2f(22, 44) => tri.freq;
		Math.random2f(100,500)::ms => now;
		Math.random2f(1000, 5000) => l0.freq;
		Math.random2f(100,500)::ms => now;
	}
}

fun void high() {
	while(true) {
		Math.random2f(2000, 17000) => saw.freq;
		Math.random2f(100,500)::ms => now;
		Math.random2f(1000, 8000) => l1.freq;
		Math.random2f(100,500)::ms => now;
	}
}

fun void high_env() {
	while(true) {
		e.keyOn();
		Math.random2f(1000, 10000)::ms => now;
		e.keyOff();
		Math.random2f(1000, 3000)::ms => now;
	}	
}

spork ~ low();
spork ~ high();
spork ~ high_env();

while(true) {
	1::second => now;
}