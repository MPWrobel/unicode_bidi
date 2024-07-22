use magnus::{function, prelude::*, Error, Ruby};
use unicode_bidi::{BidiInfo, Level};

fn bidi_inner(text: String) -> String {
    let bidi_info = BidiInfo::new(&text, Some(Level::rtl()));

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
    module.define_singleton_method("bidi_inner", function!(bidi_inner, 1))?;
    Ok(())
}
