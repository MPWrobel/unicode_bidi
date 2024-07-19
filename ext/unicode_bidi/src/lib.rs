use magnus::{function, prelude::*, Error, Ruby};
use unicode_bidi::BidiInfo;

fn bidi(text: String) -> String {
    let bidi_info = BidiInfo::new(&text, None);

    bidi_info
        .paragraphs
        .iter()
        .map(|para| {
            let line = para.range.clone();
            bidi_info.reorder_line(para, line)
        })
        .collect()
}

#[magnus::init]
fn init(ruby: &Ruby) -> Result<(), Error> {
    let module = ruby.define_module("UnicodeBidi")?;
    module.define_singleton_method("bidi", function!(bidi, 1))?;
    Ok(())
}
