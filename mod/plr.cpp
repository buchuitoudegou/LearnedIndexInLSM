#include "plr.h"
#include "util.h"
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>
#include <iomanip>

// Code modified from https://github.com/RyanMarcus/plr

double
get_slope(struct point p1, struct point p2) {
    return (p2.y - p1.y) / (p2.x - p1.x);
}

struct line
get_line(struct point p1, struct point p2) {
    double a = get_slope(p1, p2);
    double b = -a * p1.x + p1.y;
    struct line l{.a = a, .b = b};
    return l;
}

struct point
get_intersetction(struct line l1, struct line l2) {
    double a = l1.a;
    double b = l2.a;
    double c = l1.b;
    double d = l2.b;
    // std::cout<<"diff ab:"<<a<<"-"<<b<<"="<<a-b<<std::endl;
    struct point p {(d - c) / (a - b), (a * d - b * c) / (a - b)};
    return p;
}

bool
is_above(struct point pt, struct line l) {
    return pt.y > l.a * pt.x + l.b;
}

bool
is_below(struct point pt, struct line l) {
    // std::cout<<"real y:"<<pt.y<<" predy:"<<l.a * pt.x + l.b<<std::endl;

    return pt.y < l.a * pt.x + l.b;
}

struct point
get_upper_bound(struct point pt, double gamma) {
    struct point p {pt.x, pt.y + gamma};
    return p;
}

struct point
get_lower_bound(struct point pt, double gamma) {
    struct point p {pt.x, pt.y - gamma};
    return p;
}

GreedyPLR::GreedyPLR(double gamma) {
    this->state = "need2";
    this->gamma = gamma;
}

int counter = 0;

//key tag is used to show whether a key is the first/last or in the middle of a table
Segment
GreedyPLR::process(const struct point& pt, bool file, int key_tag) {
    Segment s = {0, 0, 0};
    // std::cout<<"gamma is: "<<gamma<<std::endl;
    if(key_tag == 0 && adgMod::nofence == 1){
        return s;
    }

    if(key_tag == 0 && adgMod::nofence == 2){
        return s;
    }


    struct point pt_;
    pt_ = pt;


    // std::cout<<std::setprecision(1)<<"Point coming:"<<pt_.x<<" "<<pt_.y<<" "<<key_tag<<" "<<this->state<<std::endl;


    
    if (this->state.compare("need2") == 0) {
        this->s0 = pt_;
        this->tag0 = key_tag;
        this->state = "need1";

    } else if (this->state.compare("need1") == 0) {
        this->s1 = pt_;
        this->tag1 = key_tag;
        setup(file);
        this->state = "ready";
        
    } else if (this->state.compare("ready") == 0) {
        s = process__(pt_, file, key_tag);
    } else {
        // impossible
        std::cout << "ERROR in process" << std::endl;
    }
    this->last_pt = pt_;
    this->lasttag = key_tag;
    return s;
}

void
GreedyPLR::setup(bool file) {
    struct point upper0;
    struct point lower0;
    struct point upper1;
    struct point lower1;

    if( (adgMod::nofence == 0)|| (adgMod::nofence == 2) || !file){
        upper0 = {s0.x, s0.y + gamma};
        lower0 = {s0.x, s0.y - gamma};

        upper1 = {s1.x, s1.y + gamma};
        lower1 = {s1.x, s1.y - gamma};
    }
    else{
        //TODO
        if(tag0 == 1){
            upper0 = {s0.x, s0.y + gamma};
            lower0 = {s0.x, s0.y};
        }
        else if(tag0 == 2){
            upper0 = {s0.x, s0.y};
            lower0 = {s0.x, s0.y - gamma};
        }
        if(tag1 == 1){
            upper1 = {s1.x, s1.y + gamma};
            lower1 = {s1.x, s1.y};
        }
        else if(tag1 == 2){
            upper1 = {s1.x, s1.y};
            lower1 = {s1.x, s1.y - gamma};
        }

    }


    this->rho_lower = get_line(upper0,lower1);
    this->rho_upper = get_line(lower0,upper1);
    // std::cout<<"Line info:"<<this->rho_upper.a<<" "<<this->rho_upper.b<<std::endl;
    this->sint = get_intersetction(this->rho_upper, this->rho_lower);
}

Segment
GreedyPLR::current_segment() {
    uint64_t segment_start = this->s0.x;
    double avg_slope = (this->rho_lower.a + this->rho_upper.a) / 2.0;
    if (avg_slope<0){
        avg_slope = 0;
    }
    // avg_slope = this->rho_upper.a;
    double intercept = -avg_slope * this->sint.x + this->sint.y;
    Segment s = {segment_start, avg_slope, intercept};
    return s;
}

Segment
GreedyPLR::process__(struct point pt, bool file, int key_tag) {

    if (!(is_above(pt, this->rho_lower) && is_below(pt, this->rho_upper))) {
        Segment prev_segment = current_segment();
        if (!file && (u_int32_t) pt.y % 2 == 1) {
          // current point is the largest point in the segments
            this->s0 = last_pt;
            this->tag0 = lasttag;
            this->s1 = pt;
            this->tag1 = key_tag;
            setup(file);
            this->state = "ready";
            return prev_segment;
        } else {
            if(key_tag == 1 || key_tag == 0){
                this->s0 = pt;
                this->tag0 = key_tag;
                this->state = "need1";
            }
            if(key_tag == 2){
                this->s0 = last_pt;
                this->tag0 = lasttag;
                this->s1 = pt;
                this->tag1 = key_tag;
                setup(file);
                this->state = "ready";
                // std::cout<<"\ta new seg created from the last 1 tag"<<std::endl;
                return prev_segment;
            }
            // std::cout<<"\ta new seg created from the last 1 tag"<<std::endl;
            
        }
        return prev_segment;
    }

    // std::cout<<pt.x<<std::endl;

    struct point s_upper;
    struct point s_lower;

    if((adgMod::nofence == 0)|| (adgMod::nofence == 2)|| !file){
        s_upper = get_upper_bound(pt, this->gamma);
        s_lower = get_lower_bound(pt, this->gamma);
    }
    else{
        if(key_tag == 1){ //first key in block
            s_upper = {pt.x, pt.y + this->gamma};
            s_lower = {pt.x, pt.y};
        }
        else if(key_tag == 2){ //last key in block
            s_upper = {pt.x, pt.y};
            s_lower = {pt.x, pt.y - this->gamma};
        }
        
    }

    if (is_below(s_upper, this->rho_upper)) {
        this->rho_upper = get_line(this->sint, s_upper);
    }
    if (is_above(s_lower, this->rho_lower)) {
        this->rho_lower = get_line(this->sint, s_lower);
    }
    Segment s = {0, 0, 0};
    return s;
}

Segment
GreedyPLR::finish() {
    Segment s = {0, 0, 0};
    if (this->state.compare("need2") == 0) {
        this->state = "finished";
        return s;
    } else if (this->state.compare("need1") == 0) {
        this->state = "finished";
        s.x = this->s0.x;
        s.k = 0;
        s.b = this->s0.y;
        return s;
    } else if (this->state.compare("ready") == 0) {
        this->state = "finished";
        return current_segment();
    } else {
        std::cout << "ERROR in finish" << std::endl;
        return s;
    }
}

PLR::PLR(double gamma) {
    this->gamma = gamma;
}

std::vector<Segment>&
PLR::train(std::vector<std::pair<string,int>>& keys, bool file) {
    GreedyPLR plr(this->gamma);
    int count = 0;
    size_t size = keys.size();
    for (int i = 0; i < size; ++i) {
        
        Segment seg = plr.process(point((double) stoull(keys[i].first), i), file, keys[i].second);
        if (seg.x != 0 ||
            seg.k != 0 ||
            seg.b != 0) {
            this->segments.push_back(seg);
        }

        if (!file && ++count % 10 == 0 && adgMod::env->compaction_awaiting.load() != 0) {
            segments.clear();
            return segments;
        }
    }

    Segment last = plr.finish();
    if (last.x != 0 ||
        last.k != 0 ||
        last.b != 0) {
        this->segments.push_back(last);
    }

    return this->segments;
}
