/*
 * Copyright (c) 2010, Regents of the University of California
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of the University of California, Berkeley nor the names
 *   of its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * This module is to estimate orientation of a robot
 *
 * by Stanley S. Baek
 *
 * v. beta
 *
 * Revisions:
 *  Stanley S. Baek      2010-08-27    Initial release
 *  Humphrey Hu			 2011-07-12	   Changed to fixed point   
 * 
 */


#include "attitude_q.h"
#include "xl.h"
#include "gyro.h"
#include <math.h>
#include <libq.h>
#include "libqw.h"

/*-----------------------------------------------------------------------------
 *          Static Variables
-----------------------------------------------------------------------------*/

// Floating point version of pose estimates for float output support
static union {
	struct {
		float phi;
		float theta;
		float psi;
	} fdata;
	float farray[3];
} Pose;

// Fixed point version of pose estimates
static union {
	struct {
		_Q16 phi;
		_Q16 theta;
		_Q16 psi;
	} qdata;
} PoseQ; 

static _Q16 samplePeriod = 0;
static unsigned char isRunning = 0;


/*-----------------------------------------------------------------------------
 *      Declaration of static functions (private functions)
-----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
 *          Public functions
-----------------------------------------------------------------------------*/

void attSetup(float ts) {
    
    samplePeriod = _Q16ftoi(ts);

    // initial values of roll, pitch, and yaw.
    PoseQ.qdata.phi = 0;
    PoseQ.qdata.theta = 0;
    PoseQ.qdata.psi = 0;
}

float attGetPitch(void) {
    return _itofQ16(PoseQ.qdata.theta);
}

float attGetRoll(void) {
    return _itofQ16(PoseQ.qdata.phi);
}

float attGetYaw(void) {
    return _itofQ16(PoseQ.qdata.psi);
}

// Legacy support... needs updating
float* attGetPose(void) {
	Pose.fdata.theta = attGetPitch();
	Pose.fdata.phi = attGetRoll();
	Pose.fdata.psi = attGetYaw();
    return Pose.farray;
}

unsigned char attIsRunning(void) {
    return isRunning;
}

void attSetEstimateRunning(unsigned char flag) {

    isRunning = flag;
    PoseQ.qdata.phi = 0;
    PoseQ.qdata.theta = 0;
    PoseQ.qdata.psi = 0;

}


void attReadSensorData(void) {
    gyroReadXYZ();  // 255 us
    xlReadXYZ();    // 250 us
    // Wii camera no longer used
}


void attEstimatePose(void) {

	// Fixed point implementation
	_Q16 dphi, dtheta, dpsi;
	float rate[3];
	_Q16 wx, wy, wz;
	_Q16 sin_phi, tan_theta, cos_phi, cos_theta, temp;
	
	gyroGetRadXYZ(rate);  // 50 us

	wx = _Q16ftoi(rate[0]);
	wy = _Q16ftoi(rate[1]);
	wz = _Q16ftoi(rate[2]);
	
	sin_phi = _Q16sin(PoseQ.qdata.phi);
	cos_phi = _Q16cos(PoseQ.qdata.phi);
	cos_theta = _Q16cos(PoseQ.qdata.theta);
	tan_theta = _Q16tan(PoseQ.qdata.theta);
	
	temp = _Q16mult(wy, sin_phi) + _Q16mult(wz, cos_phi);
	dphi = _Q16mult(temp, tan_theta) + wx;
	dtheta = _Q16mult(wy, cos_phi) + _Q16neg(_Q16mult(wz, sin_phi));
	dpsi = _IQ16div(temp, cos_theta);
	
	PoseQ.qdata.phi += _Q16mult(dphi, samplePeriod);
	PoseQ.qdata.theta += _Q16mult(dtheta, samplePeriod);
	PoseQ.qdata.psi += _Q16mult(dpsi, samplePeriod);
}







