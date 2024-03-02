#include "DILI.h"
#include "../global/linearReg.h"
#include "../global/global.h"
#include "../utils/data_utils.h"

#include <iostream>
#include <vector>
#include <cmath>
#include <queue>
#include <algorithm>
#include <functional>
#include <utility>
#include <cassert>
#include <thread>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <regex>
#include <cstdio>

#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>

using namespace std;


//let i = returned value,  range_tos[i] <= key < range_tos[i+1]
