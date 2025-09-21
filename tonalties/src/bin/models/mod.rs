
#[derive(Debug)]
pub enum Func { T, S, D, DD, LtDim7, Seq, Ped }

#[derive(Debug)]
pub enum Quality { Maj, Min, Dom7, Dim7, Other(&'static str) }

#[derive(Debug)]
pub struct Event {
    mm: (usize, usize),      // measure start..end (inclusive)
    key: &'static str,       // e.g., "Cmin", "Abmaj", "Ebmin"
    roman: &'static str,     // e.g., "i", "V7", "VI", "vii°7/V"
    func: Func,              // functional label
    quality: Quality,        // color/flavor
    note: &'static str,      // memory hook
}